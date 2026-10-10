import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';

part 'creditor_payment.freezed.dart';

@freezed
abstract class CreditorPayment with _$CreditorPayment {
  const factory CreditorPayment({
    required String id,
    required String creditorId,
    required String receiptNumber,
    required int amountFcfa,
    required PaymentMethod method,
    String? reason,
    required DateTime date,
    required int remainingAfterFcfa,
    required String creditorName,
    String? creditorPhone,
  }) = _CreditorPayment;
}

@freezed
abstract class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required String paymentId,
    required String transactionId,
    required String creditorId,
    required int amountFcfa,
    required PaymentMethod method,
    String? reason,
    required DateTime date,
    required String expenseText,
  }) = _PaymentRequest;
}
