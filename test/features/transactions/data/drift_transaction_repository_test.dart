import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_query.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftTransactionRepository repository;
  final day = DateTime(2026, 10, 14);

  setUp(() {
    db = createMemoryDatabase();
    repository = DriftTransactionRepository(db);
  });

  tearDown(() => db.close());

  test('ajout puis lecture conserve tous les champs, unité comprise', () async {
    final transaction = sale(
      't1',
      1000,
      day.add(const Duration(hours: 9)),
      category: TransactionCategory.vegetables,
      unit: tasUnit,
    ).copyWith(quantity: 2, product: 'tomates');

    await repository.add(transaction);

    expect(await repository.listInRange(DateRange.of(PeriodUnit.day, day)), [
      transaction,
    ]);
  });

  test('modification', () async {
    await repository.add(sale('t1', 1000, day));

    await repository.update(sale('t1', 1500, day));

    final result = await repository.listInRange(
      DateRange.of(PeriodUnit.day, day),
    );
    expect(result.single.amountFcfa, 1500);
  });

  test('modification d\'une transaction absente', () {
    expect(
      () => repository.update(sale('absente', 1000, day)),
      throwsStateError,
    );
  });

  test('suppression', () async {
    await repository.add(sale('t1', 1000, day));

    await repository.delete('t1');

    expect(
      await repository.listInRange(DateRange.of(PeriodUnit.day, day)),
      isEmpty,
    );
  });

  test('liste par période, la plus récente d\'abord', () async {
    await repository.add(sale('veille', 100, DateTime(2026, 10, 13, 23)));
    await repository.add(sale('matin', 200, DateTime(2026, 10, 14, 8)));
    await repository.add(expense('soir', 300, DateTime(2026, 10, 14, 19)));
    await repository.add(sale('lendemain', 400, DateTime(2026, 10, 15)));

    final result = await repository.listInRange(
      DateRange.of(PeriodUnit.day, day),
    );

    expect(result.map((t) => t.id), ['soir', 'matin']);
  });

  test('unité inexistante refusée par la clé étrangère', () {
    final transaction = sale(
      't1',
      1000,
      day,
    ).copyWith(unit: tasUnit.copyWith(id: 'inconnue'));

    expect(() => repository.add(transaction), throwsA(anything));
  });

  test('le flux du jour émet à chaque changement', () async {
    final stream = repository.watchDay(day);

    final expectation = expectLater(
      stream.map((transactions) => transactions.map((t) => t.id).toList()),
      emitsInOrder([
        isEmpty,
        ['t1'],
        ['t2', 't1'],
      ]),
    );

    await pumpEventQueue();
    await repository.add(sale('t1', 1000, DateTime(2026, 10, 14, 8)));
    await pumpEventQueue();
    await repository.add(sale('autre-jour', 1000, DateTime(2026, 10, 16)));
    await repository.add(expense('t2', 500, DateTime(2026, 10, 14, 9)));

    await expectation;
  });

  group('pagination et filtres', () {
    Future<void> seed() async {
      for (var i = 0; i < 25; i++) {
        await repository.add(
          i.isEven
              ? sale(
                  'v$i',
                  1000 + i,
                  DateTime(2026, 10, 1 + i ~/ 3, 8 + i % 3),
                  category: TransactionCategory.vegetables,
                )
              : expense(
                  'd$i',
                  500 + i,
                  DateTime(2026, 10, 1 + i ~/ 3, 8 + i % 3),
                  category: TransactionCategory.transport,
                ),
        );
      }
    }

    test(
      "pages successives sans doublon ni trou, plus récentes d'abord",
      () async {
        await seed();
        final seen = <String>[];
        TransactionCursor? cursor;
        while (true) {
          final page = await repository.listPage(limit: 7, after: cursor);
          if (page.isEmpty) break;
          seen.addAll(page.map((t) => t.id));
          cursor = TransactionCursor.after(page.last);
        }

        expect(seen, hasLength(25));
        expect(seen.toSet(), hasLength(25));
        final all = await repository.listPage(limit: 100);
        expect(seen, all.map((t) => t.id).toList());
        expect(all.first.date.isAfter(all.last.date), isTrue);
      },
    );

    test('même date : départage stable par identifiant', () async {
      final sameTime = DateTime(2026, 10, 14, 12);
      for (final id in ['a', 'b', 'c', 'd']) {
        await repository.add(sale(id, 100, sameTime));
      }

      final first = await repository.listPage(limit: 2);
      final second = await repository.listPage(
        limit: 2,
        after: TransactionCursor.after(first.last),
      );

      expect(first.map((t) => t.id), ['d', 'c']);
      expect(second.map((t) => t.id), ['b', 'a']);
    });

    test('filtre par type', () async {
      await seed();

      final sales = await repository.listPage(
        query: const TransactionQuery(type: TransactionType.sale),
        limit: 100,
      );

      expect(sales, hasLength(13));
      expect(sales.every((t) => t.type == TransactionType.sale), isTrue);
    });

    test('filtre par catégorie et par période combinés', () async {
      await seed();

      final result = await repository.listPage(
        query: TransactionQuery(
          range: DateRange.of(PeriodUnit.day, DateTime(2026, 10, 2)),
          category: TransactionCategory.transport,
        ),
        limit: 100,
      );

      expect(result.map((t) => t.id), ['d5', 'd3']);
    });

    test('recherche par identifiant', () async {
      await repository.add(sale('t1', 1000, day, unit: tasUnit));

      expect((await repository.findById('t1'))?.unit, tasUnit);
      expect(await repository.findById('absent'), isNull);
    });

    test(
      'le flux des changements signale ajout, modification et suppression',
      () async {
        var changes = 0;
        final subscription = repository.watchChanges().listen((_) => changes++);

        await repository.add(sale('t1', 1000, day));
        await pumpEventQueue();
        await repository.update(sale('t1', 2000, day));
        await pumpEventQueue();
        await repository.delete('t1');
        await pumpEventQueue();

        expect(changes, 3);
        await subscription.cancel();
      },
    );
  });
}
