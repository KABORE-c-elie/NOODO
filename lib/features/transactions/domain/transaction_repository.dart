import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';

abstract interface class TransactionRepository {
  Future<void> add(Transaction transaction);

  Future<void> update(Transaction transaction);

  Future<void> delete(String id);

  Future<List<Transaction>> listInRange(DateRange range);

  Stream<List<Transaction>> watchDay(DateTime day);
}
