import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';
import 'package:noodo/features/profits/domain/anomaly_detector.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

import '../../../helpers/fixtures.dart';

void main() {
  const detector = AnomalyDetector();
  final today = DateTime(2026, 10, 14, 15);

  DateTime daysAgo(int days, {int hour = 10}) =>
      DateTime(2026, 10, 14 - days, hour);

  List<Transaction> transportHistory() => [
    for (final days in [3, 8, 15, 22])
      expense(
        'hist-$days',
        1000,
        daysAgo(days),
        category: TransactionCategory.transport,
      ),
  ];

  List<Anomaly> detect(
    List<Transaction> transactions, {
    AlertSensitivity sensitivity = AlertSensitivity.normal,
  }) => detector.detect(
    transactions: transactions,
    today: today,
    sensitivity: sensitivity,
  );

  group('dépense inhabituelle', () {
    test(
      'dépense du jour nettement au-dessus de la moyenne de sa catégorie',
      () {
        final anomalies = detect([
          ...transportHistory(),
          expense(
            'taxi',
            2500,
            today,
            category: TransactionCategory.transport,
          ).copyWith(product: 'taxi'),
        ]);

        expect(anomalies, [
          Anomaly(
            type: AnomalyType.unusualExpense,
            day: DateTime(2026, 10, 14),
            amountFcfa: 2500,
            averageFcfa: 1000,
            category: TransactionCategory.transport,
            label: 'taxi',
          ),
        ]);
      },
    );

    test('seuil selon la sensibilité', () {
      final transactions = [
        ...transportHistory(),
        expense('taxi', 1800, today, category: TransactionCategory.transport),
      ];

      expect(
        detect(transactions, sensitivity: AlertSensitivity.high),
        hasLength(1),
      );
      expect(
        detect(transactions, sensitivity: AlertSensitivity.normal),
        isEmpty,
      );
      expect(detect(transactions, sensitivity: AlertSensitivity.low), isEmpty);
      expect(
        detect([
          ...transactions.take(4),
          expense('taxi', 3500, today, category: TransactionCategory.transport),
        ], sensitivity: AlertSensitivity.low),
        hasLength(1),
      );
    });

    test('pas assez d\'historique dans la catégorie', () {
      final anomalies = detect([
        expense('a', 1000, daysAgo(2), category: TransactionCategory.transport),
        expense('b', 1000, daysAgo(4), category: TransactionCategory.transport),
        expense('taxi', 9000, today, category: TransactionCategory.transport),
      ]);

      expect(anomalies, isEmpty);
    });

    test(
      'l\'historique de plus de 30 jours et des autres catégories est ignoré',
      () {
        final anomalies = detect([
          for (final days in [31, 40, 50])
            expense(
              'old-$days',
              100,
              daysAgo(days),
              category: TransactionCategory.transport,
            ),
          for (final days in [2, 3, 4])
            expense(
              'veg-$days',
              100,
              daysAgo(days),
              category: TransactionCategory.vegetables,
            ),
          expense('taxi', 9000, today, category: TransactionCategory.transport),
        ]);

        expect(anomalies, isEmpty);
      },
    );

    test('au plus une alerte par jour : la plus forte est retenue', () {
      final anomalies = detect([
        ...transportHistory(),
        for (final days in [2, 5, 9])
          expense(
            'sac-$days',
            500,
            daysAgo(days),
            category: TransactionCategory.supplies,
          ),
        expense('taxi', 3000, today, category: TransactionCategory.transport),
        expense(
          'sacs',
          2500,
          today,
          category: TransactionCategory.supplies,
        ).copyWith(product: 'sacs'),
      ]);

      expect(anomalies, hasLength(1));
      expect(anomalies.single.label, 'sacs');
      expect(anomalies.single.averageFcfa, 500);
    });
  });

  group('bénéfice faible', () {
    List<Transaction> goodWeek() => [
      for (final days in [2, 3, 4, 5]) sale('v-$days', 10000, daysAgo(days)),
    ];

    test('la veille très en dessous de la moyenne des 7 jours précédents', () {
      final anomalies = detect([...goodWeek(), sale('hier', 3000, daysAgo(1))]);

      expect(anomalies, [
        Anomaly(
          type: AnomalyType.lowProfitDay,
          day: DateTime(2026, 10, 13),
          amountFcfa: 3000,
          averageFcfa: 10000,
        ),
      ]);
    });

    test('seuil selon la sensibilité', () {
      final transactions = [...goodWeek(), sale('hier', 6000, daysAgo(1))];

      expect(
        detect(transactions, sensitivity: AlertSensitivity.high),
        hasLength(1),
      );
      expect(
        detect(transactions, sensitivity: AlertSensitivity.normal),
        isEmpty,
      );
      expect(
        detect([
          ...goodWeek(),
          sale('hier', 2000, daysAgo(1)),
        ], sensitivity: AlertSensitivity.low),
        hasLength(1),
      );
      expect(
        detect([
          ...goodWeek(),
          sale('hier', 3000, daysAgo(1)),
        ], sensitivity: AlertSensitivity.low),
        isEmpty,
      );
    });

    test('pas assez de jours d\'activité', () {
      final anomalies = detect([
        sale('a', 10000, daysAgo(2)),
        sale('b', 10000, daysAgo(3)),
        sale('hier', 1000, daysAgo(1)),
      ]);

      expect(anomalies, isEmpty);
    });

    test('jour sans aucune transaction : pas d\'alerte (marché fermé)', () {
      expect(detect(goodWeek()), isEmpty);
    });

    test('moyenne négative ou nulle : pas d\'alerte', () {
      final anomalies = detect([
        for (final days in [2, 3, 4]) expense('d-$days', 1000, daysAgo(days)),
        sale('hier', 100, daysAgo(1)),
      ]);

      expect(anomalies, isEmpty);
    });
  });

  test(
    'les deux règles peuvent se déclencher le même jour, une fois chacune',
    () {
      final anomalies = detect([
        ...transportHistory(),
        for (final days in [2, 3, 4, 5]) sale('v-$days', 10000, daysAgo(days)),
        sale('hier', 1000, daysAgo(1)),
        expense('taxi', 5000, today, category: TransactionCategory.transport),
        expense('moto', 4000, today, category: TransactionCategory.transport),
      ]);

      expect(anomalies.map((a) => a.type), [
        AnomalyType.unusualExpense,
        AnomalyType.lowProfitDay,
      ]);
    },
  );
}
