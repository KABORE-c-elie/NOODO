import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/data/local_unit_mapper.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_repository.dart';

final class DriftTransactionRepository implements TransactionRepository {
  const DriftTransactionRepository(this._db);

  final AppDatabase _db;

  @override
  Future<void> add(Transaction transaction) =>
      _db.into(_db.transactions).insert(_toCompanion(transaction));

  @override
  Future<void> update(Transaction transaction) async {
    final updated = await _db
        .update(_db.transactions)
        .replace(_toCompanion(transaction));
    if (!updated) {
      throw StateError('Transaction ${transaction.id} introuvable');
    }
  }

  @override
  Future<void> delete(String id) =>
      (_db.delete(_db.transactions)..where((t) => t.id.equals(id))).go();

  @override
  Future<List<Transaction>> listInRange(DateRange range) =>
      _selectInRange(range).get().then(_toDomainList);

  @override
  Stream<List<Transaction>> watchDay(DateTime day) =>
      _selectInRange(DateRange.of(PeriodUnit.day, day))
          .watch()
          .map(_toDomainList)
          .distinct(listEquals);

  JoinedSelectStatement<HasResultSet, dynamic> _selectInRange(DateRange range) {
    final t = _db.transactions;
    return _db.select(t).join([
        leftOuterJoin(_db.localUnits, _db.localUnits.id.equalsExp(t.unitId)),
      ])
      ..where(
        t.date.isBiggerOrEqualValue(range.start) &
            t.date.isSmallerThanValue(range.end),
      )
      ..orderBy([OrderingTerm.desc(t.date)]);
  }

  List<Transaction> _toDomainList(List<TypedResult> rows) =>
      rows.map(_toDomain).toList();

  Transaction _toDomain(TypedResult result) {
    final row = result.readTable(_db.transactions);
    final unit = result.readTableOrNull(_db.localUnits);
    return Transaction(
      id: row.id,
      type: row.type,
      amountFcfa: row.amountFcfa,
      quantity: row.quantity,
      unit: unit?.toDomain(),
      product: row.product,
      category: row.category,
      rawText: row.rawText,
      date: row.date,
    );
  }

  TransactionsCompanion _toCompanion(Transaction transaction) =>
      TransactionsCompanion(
        id: Value(transaction.id),
        type: Value(transaction.type),
        amountFcfa: Value(transaction.amountFcfa),
        quantity: Value(transaction.quantity),
        unitId: Value(transaction.unit?.id),
        product: Value(transaction.product),
        category: Value(transaction.category),
        rawText: Value(transaction.rawText),
        date: Value(transaction.date),
      );
}
