import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/data/local_unit_mapper.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_query.dart';
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
  Future<Transaction?> findById(String id) async {
    final row =
        await (_selectNewestFirst()..where(_db.transactions.id.equals(id)))
            .getSingleOrNull();
    return row == null ? null : _toDomain(row);
  }

  @override
  Future<List<Transaction>> listPage({
    TransactionQuery query = const TransactionQuery(),
    TransactionCursor? after,
    required int limit,
  }) {
    final t = _db.transactions;
    final range = query.range;
    final type = query.type;
    final category = query.category;
    final conditions = [
      if (range != null) ...[
        t.date.isBiggerOrEqualValue(range.start),
        t.date.isSmallerThanValue(range.end),
      ],
      if (type != null) t.type.equalsValue(type),
      if (category != null) t.category.equalsValue(category),
      if (after != null)
        t.date.isSmallerThanValue(after.date) |
            (t.date.equals(after.date) & t.id.isSmallerThanValue(after.id)),
    ];
    final select = _selectNewestFirst()..limit(limit);
    if (conditions.isNotEmpty) select.where(Expression.and(conditions));
    return select.get().then(_toDomainList);
  }

  @override
  Stream<void> watchChanges() =>
      _db.tableUpdates(TableUpdateQuery.onTable(_db.transactions)).map((_) {});

  @override
  Future<List<Transaction>> listInRange(DateRange range) =>
      _selectInRange(range).get().then(_toDomainList);

  @override
  Stream<List<Transaction>> watchDay(DateTime day) =>
      watchInRange(DateRange.of(PeriodUnit.day, day));

  @override
  Stream<List<Transaction>> watchInRange(DateRange range) =>
      _watch(_selectInRange(range));

  @override
  Stream<List<Transaction>> watchLatest(int limit) =>
      _watch(_selectNewestFirst()..limit(limit));

  Stream<List<Transaction>> _watch(
    JoinedSelectStatement<HasResultSet, dynamic> query,
  ) => query.watch().map(_toDomainList).distinct(listEquals);

  JoinedSelectStatement<HasResultSet, dynamic> _selectNewestFirst() {
    final t = _db.transactions;
    return _db.select(t).join([
      leftOuterJoin(_db.localUnits, _db.localUnits.id.equalsExp(t.unitId)),
    ])..orderBy([OrderingTerm.desc(t.date), OrderingTerm.desc(t.id)]);
  }

  JoinedSelectStatement<HasResultSet, dynamic> _selectInRange(DateRange range) {
    final t = _db.transactions;
    return _selectNewestFirst()..where(
      t.date.isBiggerOrEqualValue(range.start) &
          t.date.isSmallerThanValue(range.end),
    );
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
