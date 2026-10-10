import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

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
}
