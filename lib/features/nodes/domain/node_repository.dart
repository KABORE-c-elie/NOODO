import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

abstract interface class NodeRepository {
  Future<List<CreditorNode>> listCreditors();

  Stream<List<CreditorNode>> watchCreditors();

  Future<CreditorNode?> findCreditor(String id);

  Stream<CreditorNode?> watchCreditor(String id);

  Future<void> addCreditor(CreditorNode creditor);

  Future<void> updateCreditor(CreditorNode creditor);

  Future<void> deleteCreditor(String id);

  Future<CreditorPayment> recordPayment(PaymentRequest request);

  Stream<List<CreditorPayment>> watchPayments(String creditorId);

  Future<TaxNode> getTaxNode();

  Stream<TaxNode> watchTaxNode();

  Future<void> updateTaxNode(TaxNode taxNode);
}
