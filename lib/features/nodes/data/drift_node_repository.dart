import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/node_repository.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

final class DriftNodeRepository implements NodeRepository {
  const DriftNodeRepository(this._db);

  final AppDatabase _db;

  @override
  Future<List<CreditorNode>> listCreditors() async {
    final rows =
        await (_db.select(_db.creditorNodes)..orderBy([
              (c) => OrderingTerm.asc(c.dueDate, nulls: NullsOrder.last),
              (c) => OrderingTerm.asc(c.supplierName),
            ]))
            .get();
    return rows.map(_creditorToDomain).toList();
  }

  @override
  Future<CreditorNode?> findCreditor(String id) async {
    final row = await (_db.select(
      _db.creditorNodes,
    )..where((c) => c.id.equals(id))).getSingleOrNull();
    return row == null ? null : _creditorToDomain(row);
  }

  @override
  Future<void> addCreditor(CreditorNode creditor) =>
      _db.into(_db.creditorNodes).insert(_creditorToCompanion(creditor));

  @override
  Future<void> updateCreditor(CreditorNode creditor) async {
    final updated = await _db
        .update(_db.creditorNodes)
        .replace(_creditorToCompanion(creditor));
    if (!updated) {
      throw StateError('Nœud créancier ${creditor.id} introuvable');
    }
  }

  @override
  Future<void> deleteCreditor(String id) =>
      (_db.delete(_db.creditorNodes)..where((c) => c.id.equals(id))).go();

  @override
  Future<TaxNode> getTaxNode() async {
    final row = await (_db.select(_db.taxNodes)..limit(1)).getSingleOrNull();
    if (row != null) return _taxToDomain(row);

    final initial = TaxNode.initial();
    await updateTaxNode(initial);
    return initial;
  }

  @override
  Future<void> updateTaxNode(TaxNode taxNode) => _db
      .into(_db.taxNodes)
      .insertOnConflictUpdate(
        TaxNodesCompanion(
          id: Value(taxNode.id),
          rateBasisPoints: Value(taxNode.rateBasisPoints),
          savedBalanceFcfa: Value(taxNode.savedBalanceFcfa),
        ),
      );

  CreditorNode _creditorToDomain(CreditorNodeRow row) => CreditorNode(
    id: row.id,
    supplierName: row.supplierName,
    phone: row.phone,
    balanceDueFcfa: row.balanceDueFcfa,
    dueDate: row.dueDate,
  );

  CreditorNodesCompanion _creditorToCompanion(CreditorNode creditor) =>
      CreditorNodesCompanion(
        id: Value(creditor.id),
        supplierName: Value(creditor.supplierName),
        phone: Value(creditor.phone),
        balanceDueFcfa: Value(creditor.balanceDueFcfa),
        dueDate: Value(creditor.dueDate),
      );

  TaxNode _taxToDomain(TaxNodeRow row) => TaxNode(
    id: row.id,
    rateBasisPoints: row.rateBasisPoints,
    savedBalanceFcfa: row.savedBalanceFcfa,
  );
}
