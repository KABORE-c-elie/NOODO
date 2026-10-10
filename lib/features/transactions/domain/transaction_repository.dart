import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_query.dart';

abstract interface class TransactionRepository {
  Future<({int taxSavedFcfa})> add(Transaction transaction);

  Future<void> update(Transaction transaction);

  Future<void> delete(String id);

  Future<Transaction?> findById(String id);

  Future<List<Transaction>> listInRange(DateRange range);

  Future<List<Transaction>> listPage({
    TransactionQuery query = const TransactionQuery(),
    TransactionCursor? after,
    required int limit,
  });

  Stream<void> watchChanges();

  Stream<List<Transaction>> watchDay(DateTime day);

  Stream<List<Transaction>> watchInRange(DateRange range);

  Stream<List<Transaction>> watchLatest(int limit);
}
