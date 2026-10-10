import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/presentation/node_labels.dart';

String buildReceiptText(
  CreditorPayment payment,
  AppLocalizations l10n,
  String locale,
) {
  final date = payment.date;
  final dateTime = l10n.receiptDateTime(
    DateFormat.yMMMMd(locale).format(date),
    l10n.receiptTime(
      date.hour.toString().padLeft(2, '0'),
      date.minute.toString().padLeft(2, '0'),
    ),
  );
  final method = switch (payment.method) {
    PaymentMethod.cash => payment.method.label(l10n),
    PaymentMethod.orangeMoney || PaymentMethod.moovMoney =>
      l10n.receiptMobileMoney(payment.method.label(l10n)),
  };
  final phone = payment.creditorPhone;
  final reason = payment.reason;
  return [
    l10n.receiptHeader,
    l10n.receiptNumberLine(payment.receiptNumber, dateTime),
    l10n.receiptCreditorLine(payment.creditorName),
    if (phone != null && phone.isNotEmpty) l10n.receiptPhoneLine(phone),
    l10n.receiptAmountLine(payment.amountFcfa),
    l10n.receiptMethodLine(method),
    if (reason != null && reason.isNotEmpty) l10n.receiptReasonLine(reason),
    l10n.receiptRemainingLine(payment.remainingAfterFcfa),
  ].join('\n');
}
