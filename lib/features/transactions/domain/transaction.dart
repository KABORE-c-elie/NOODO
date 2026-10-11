import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required String id,
    required TransactionType type,
    required int amountFcfa,
    double? quantity,
    LocalUnit? unit,
    String? product,
    @Default(TransactionCategory.other) TransactionCategory category,
    required String rawText,
    required DateTime date,
    String? paymentCreditorId,
  }) = _Transaction;

  bool get isCreditorPayment => paymentCreditorId != null;
}
