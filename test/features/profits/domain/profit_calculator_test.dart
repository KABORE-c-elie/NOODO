import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

import '../../../helpers/fixtures.dart';

void main() {
  const calculator = ProfitCalculator();
  final today = DateTime(2026, 10, 14, 12);
  final yesterday = DateTime(2026, 10, 13, 12);
  final dayRange = DateRange.of(PeriodUnit.day, today);

  group('résumé d\'une période', () {
    test('bénéfice net = ventes - dépenses', () {
      final summary = calculator.summarize([
        sale('v1', 1000, today),
        sale('v2', 2500, today),
        expense('d1', 800, today),
      ], dayRange);

      expect(summary.salesFcfa, 3500);
      expect(summary.expensesFcfa, 800);
      expect(summary.netFcfa, 2700);
    });

    test('ignore les transactions hors période', () {
      final summary = calculator.summarize([
        sale('v1', 1000, today),
        sale('hier', 5000, yesterday),
        sale('minuit', 7000, DateTime(2026, 10, 15)),
      ], dayRange);

      expect(summary.salesFcfa, 1000);
    });

    test('période vide', () {
      final summary = calculator.summarize([], dayRange);

      expect(
        summary,
        ProfitSummary(range: dayRange, salesFcfa: 0, expensesFcfa: 0),
      );
      expect(summary.netFcfa, 0);
    });

    test('uniquement des dépenses : bénéfice négatif', () {
      final summary = calculator.summarize([
        expense('d1', 3000, today),
        expense('d2', 500, today),
      ], dayRange);

      expect(summary.salesFcfa, 0);
      expect(summary.netFcfa, -3500);
    });

    test('semaine et mois', () {
      final transactions = [
        sale('lundi', 1000, DateTime(2026, 10, 12)),
        sale('dimanche', 2000, DateTime(2026, 10, 18, 23)),
        sale('semaine-avant', 4000, DateTime(2026, 10, 11)),
        sale('mois-avant', 8000, DateTime(2026, 9, 30)),
      ];

      expect(
        calculator
            .summarize(transactions, DateRange.of(PeriodUnit.week, today))
            .netFcfa,
        3000,
      );
      expect(
        calculator
            .summarize(transactions, DateRange.of(PeriodUnit.month, today))
            .netFcfa,
        7000,
      );
    });
  });

  group('comparaison avec la période précédente', () {
    test('hausse en FCFA et en pourcentage', () {
      final comparison = calculator.compare(
        [sale('auj', 12500, today), sale('hier', 10000, yesterday)],
        PeriodUnit.day,
        today,
      );

      expect(comparison.current.netFcfa, 12500);
      expect(comparison.previous.netFcfa, 10000);
      expect(comparison.differenceFcfa, 2500);
      expect(comparison.differencePercent, 25);
    });

    test('baisse', () {
      final comparison = calculator.compare(
        [sale('auj', 3000, today), sale('hier', 4000, yesterday)],
        PeriodUnit.day,
        today,
      );

      expect(comparison.differenceFcfa, -1000);
      expect(comparison.differencePercent, -25);
    });

    test('période précédente à zéro : pourcentage indéfini', () {
      final comparison = calculator.compare(
        [sale('auj', 3000, today)],
        PeriodUnit.day,
        today,
      );

      expect(comparison.differenceFcfa, 3000);
      expect(comparison.differencePercent, isNull);
    });

    test(
      'période précédente négative : pourcentage relatif à sa valeur absolue',
      () {
        final comparison = calculator.compare(
          [sale('auj', 1000, today), expense('hier', 2000, yesterday)],
          PeriodUnit.day,
          today,
        );

        expect(comparison.differenceFcfa, 3000);
        expect(comparison.differencePercent, 150);
      },
    );

    test('deux périodes vides', () {
      final comparison = calculator.compare([], PeriodUnit.week, today);

      expect(comparison.differenceFcfa, 0);
      expect(comparison.differencePercent, isNull);
    });
  });

  group('répartition par catégorie', () {
    test('triée par bénéfice décroissant', () {
      final result = calculator.byCategory([
        sale('v1', 2000, today, category: TransactionCategory.vegetables),
        expense('d1', 500, today, category: TransactionCategory.vegetables),
        sale('v2', 5000, today, category: TransactionCategory.cereals),
        expense('d2', 1000, today, category: TransactionCategory.transport),
        sale('hier', 9000, yesterday, category: TransactionCategory.supplies),
      ], dayRange);

      expect(result, const [
        CategoryProfit(
          category: TransactionCategory.cereals,
          salesFcfa: 5000,
          expensesFcfa: 0,
        ),
        CategoryProfit(
          category: TransactionCategory.vegetables,
          salesFcfa: 2000,
          expensesFcfa: 500,
        ),
        CategoryProfit(
          category: TransactionCategory.transport,
          salesFcfa: 0,
          expensesFcfa: 1000,
        ),
      ]);
    });

    test('égalité départagée par l\'ordre des catégories', () {
      final result = calculator.byCategory([
        sale('v1', 1000, today, category: TransactionCategory.other),
        sale('v2', 1000, today, category: TransactionCategory.vegetables),
      ], dayRange);

      expect(result.map((c) => c.category), [
        TransactionCategory.vegetables,
        TransactionCategory.other,
      ]);
    });

    test('période vide', () {
      expect(calculator.byCategory([], dayRange), isEmpty);
    });
  });

  group('bénéfice par jour', () {
    test('un point par jour de la période, jours vides à zéro', () {
      final week = DateRange.of(PeriodUnit.week, today);

      final days = calculator.daily([
        sale('lundi', 3000, DateTime(2026, 10, 12, 9)),
        expense('lundi-d', 1000, DateTime(2026, 10, 12, 18)),
        sale('mercredi', 5000, today),
        sale('hors-periode', 9000, DateTime(2026, 10, 19)),
      ], week);

      expect(days, hasLength(7));
      expect(days.first.day, DateTime(2026, 10, 12));
      expect(days.map((d) => d.netFcfa), [2000, 0, 5000, 0, 0, 0, 0]);
    });

    test('mois complet', () {
      final days = calculator.daily(
        [],
        DateRange.of(PeriodUnit.month, DateTime(2026, 2, 10)),
      );

      expect(days, hasLength(28));
      expect(days.every((d) => d.netFcfa == 0), isTrue);
    });
  });
}
