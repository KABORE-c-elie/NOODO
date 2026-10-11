import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'transaction_query.freezed.dart';

@freezed
abstract class TransactionQuery with _$TransactionQuery {
  const factory TransactionQuery({
    DateRange? range,
    TransactionType? type,
    TransactionCategory? category,
  }) = _TransactionQuery;
}

@freezed
abstract class TransactionCursor with _$TransactionCursor {
  const factory TransactionCursor({
    required DateTime date,
    required String id,
  }) = _TransactionCursor;

  factory TransactionCursor.after(Transaction transaction) =>
      TransactionCursor(date: transaction.date, id: transaction.id);
}
