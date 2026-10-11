import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

part 'anomaly.freezed.dart';

enum AnomalyType { unusualExpense, lowProfitDay }

@freezed
abstract class Anomaly with _$Anomaly {
  const factory Anomaly({
    required AnomalyType type,
    required DateTime day,
    required int amountFcfa,
    required int averageFcfa,
    TransactionCategory? category,
    String? label,
  }) = _Anomaly;
}

abstract interface class AnomalyDismissals {
  Stream<Set<AnomalyType>> watchDismissed(DateTime day);

  Future<void> dismiss(AnomalyType type, DateTime day);
}
