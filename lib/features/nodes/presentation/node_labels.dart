import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';

extension PaymentMethodLabel on PaymentMethod {
  String label(AppLocalizations l10n) => switch (this) {
    PaymentMethod.cash => l10n.methodCash,
    PaymentMethod.orangeMoney => l10n.methodOrangeMoney,
    PaymentMethod.moovMoney => l10n.methodMoovMoney,
  };
}

extension CreditorStatus on CreditorNode {
  bool isOverdue(DateTime today) {
    final due = dueDate;
    return due != null && balanceDueFcfa > 0 && due.isBefore(today);
  }
}
