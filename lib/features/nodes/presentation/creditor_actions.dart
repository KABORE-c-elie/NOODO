import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'creditor_actions.g.dart';

@riverpod
CreditorActions creditorActions(Ref ref) => CreditorActions(ref);

final class CreditorActions {
  const CreditorActions(this._ref);

  static const _uuid = Uuid();

  final Ref _ref;

  Future<CreditorNode> addCreditor({
    required String supplierName,
    String? phone,
    required int balanceDueFcfa,
    DateTime? dueDate,
  }) async {
    final creditor = CreditorNode(
      id: _uuid.v4(),
      supplierName: supplierName.trim(),
      phone: phone == null || phone.trim().isEmpty ? null : phone.trim(),
      balanceDueFcfa: balanceDueFcfa,
      dueDate: dueDate,
    );
    await _ref.read(nodeRepositoryProvider).addCreditor(creditor);
    return creditor;
  }

  Future<CreditorPayment> recordPayment({
    required String creditorId,
    required int amountFcfa,
    required PaymentMethod method,
    String? reason,
    required String expenseText,
  }) => _ref
      .read(nodeRepositoryProvider)
      .recordPayment(
        PaymentRequest(
          paymentId: _uuid.v4(),
          transactionId: _uuid.v4(),
          creditorId: creditorId,
          amountFcfa: amountFcfa,
          method: method,
          reason: reason == null || reason.trim().isEmpty
              ? null
              : reason.trim(),
          date: _ref.read(clockProvider)(),
          expenseText: expenseText,
        ),
      );
}
