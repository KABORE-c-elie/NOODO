import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

abstract interface class NodeRepository {
  Future<List<CreditorNode>> listCreditors();

  Future<CreditorNode?> findCreditor(String id);

  Future<void> addCreditor(CreditorNode creditor);

  Future<void> updateCreditor(CreditorNode creditor);

  Future<void> deleteCreditor(String id);

  Future<TaxNode> getTaxNode();

  Future<void> updateTaxNode(TaxNode taxNode);
}
