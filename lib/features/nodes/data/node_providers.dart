import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/data/share_plus_receipt_sharer.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/node_repository.dart';
import 'package:noodo/features/nodes/domain/receipt_sharer.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'node_providers.g.dart';

@Riverpod(keepAlive: true)
NodeRepository nodeRepository(Ref ref) =>
    DriftNodeRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
ReceiptSharer receiptSharer(Ref ref) => const SharePlusReceiptSharer();

@riverpod
Stream<TaxNode> taxNode(Ref ref) =>
    ref.watch(nodeRepositoryProvider).watchTaxNode();

@riverpod
Stream<List<CreditorNode>> creditors(Ref ref) =>
    ref.watch(nodeRepositoryProvider).watchCreditors();

@riverpod
Stream<CreditorNode?> creditor(Ref ref, String id) =>
    ref.watch(nodeRepositoryProvider).watchCreditor(id);

@riverpod
Stream<List<CreditorPayment>> creditorPayments(Ref ref, String creditorId) =>
    ref.watch(nodeRepositoryProvider).watchPayments(creditorId);
