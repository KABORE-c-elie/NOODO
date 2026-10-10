import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/node_repository.dart';
import 'package:noodo/features/nodes/domain/receipt_number.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

final class DriftNodeRepository implements NodeRepository {
  const DriftNodeRepository(this._db);

  final AppDatabase _db;

  @override
  Future<List<CreditorNode>> listCreditors() =>
      _selectCreditors().get().then(_creditorsToDomain);

  @override
  Stream<List<CreditorNode>> watchCreditors() =>
      _selectCreditors().watch().map(_creditorsToDomain);

  @override
  Future<CreditorNode?> findCreditor(String id) =>
      _selectCreditor(id).getSingleOrNull().then(_creditorOrNull);

  @override
  Stream<CreditorNode?> watchCreditor(String id) =>
      _selectCreditor(id).watchSingleOrNull().map(_creditorOrNull);

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
  Future<CreditorPayment> recordPayment(PaymentRequest request) =>
      _db.transaction(() async {
        final creditor = await _selectCreditor(request.creditorId)
            .getSingleOrNull();
        if (creditor == null) {
          throw StateError('Nœud créancier ${request.creditorId} introuvable');
        }
        if (request.amountFcfa <= 0 ||
            request.amountFcfa > creditor.balanceDueFcfa) {
          throw RangeError.range(
            request.amountFcfa,
            1,
            creditor.balanceDueFcfa,
            'amountFcfa',
          );
        }

        final remaining = creditor.balanceDueFcfa - request.amountFcfa;
        await (_db.update(_db.creditorNodes)
              ..where((c) => c.id.equals(creditor.id)))
            .write(CreditorNodesCompanion(balanceDueFcfa: Value(remaining)));
        await _db
            .into(_db.transactions)
            .insert(
              TransactionsCompanion.insert(
                id: request.transactionId,
                type: TransactionType.expense,
                amountFcfa: request.amountFcfa,
                product: Value(creditor.supplierName),
                rawText: request.expenseText,
                date: request.date,
              ),
            );

        final payment = CreditorPayment(
          id: request.paymentId,
          creditorId: creditor.id,
          receiptNumber: await _nextReceiptNumber(request.date.year),
          amountFcfa: request.amountFcfa,
          method: request.method,
          reason: request.reason,
          date: request.date,
          remainingAfterFcfa: remaining,
          creditorName: creditor.supplierName,
          creditorPhone: creditor.phone,
        );
        await _db
            .into(_db.creditorPayments)
            .insert(
              CreditorPaymentsCompanion.insert(
                id: payment.id,
                creditorId: payment.creditorId,
                transactionId: Value(request.transactionId),
                receiptNumber: payment.receiptNumber,
                amountFcfa: payment.amountFcfa,
                method: payment.method,
                reason: Value(payment.reason),
                date: payment.date,
                remainingAfterFcfa: payment.remainingAfterFcfa,
                creditorName: payment.creditorName,
                creditorPhone: Value(payment.creditorPhone),
              ),
            );
        return payment;
      });

  @override
  Stream<List<CreditorPayment>> watchPayments(String creditorId) =>
      (_db.select(_db.creditorPayments)
            ..where((p) => p.creditorId.equals(creditorId))
            ..orderBy([
              (p) => OrderingTerm.desc(p.date),
              (p) => OrderingTerm.desc(p.receiptNumber),
            ]))
          .watch()
          .map((rows) => rows.map(_paymentToDomain).toList());

  @override
  Future<TaxNode> getTaxNode() =>
      _selectTaxNode().getSingleOrNull().then(_taxOrInitial);

  @override
  Stream<TaxNode> watchTaxNode() =>
      _selectTaxNode().watchSingleOrNull().map(_taxOrInitial);

  @override
  Future<void> updateTaxNode(TaxNode taxNode) => _db
      .into(_db.taxNodes)
      .insertOnConflictUpdate(
        TaxNodesCompanion(
          id: Value(taxNode.id),
          rateBasisPoints: Value(taxNode.rateBasisPoints),
          savedBalanceFcfa: Value(taxNode.savedBalanceFcfa),
          nextDueDate: Value(taxNode.nextDueDate),
        ),
      );

  Future<String> _nextReceiptNumber(int year) async {
    final sequence = await (_db.select(
      _db.receiptSequences,
    )..where((s) => s.year.equals(year))).getSingleOrNull();
    final next = (sequence?.lastNumber ?? 0) + 1;
    await _db
        .into(_db.receiptSequences)
        .insertOnConflictUpdate(
          ReceiptSequencesCompanion(year: Value(year), lastNumber: Value(next)),
        );
    return formatReceiptNumber(year, next);
  }

  SimpleSelectStatement<$CreditorNodesTable, CreditorNodeRow>
  _selectCreditors() => _db.select(_db.creditorNodes)
    ..orderBy([
      (c) => OrderingTerm.asc(c.dueDate, nulls: NullsOrder.last),
      (c) => OrderingTerm.asc(c.supplierName),
    ]);

  SimpleSelectStatement<$CreditorNodesTable, CreditorNodeRow> _selectCreditor(
    String id,
  ) => _db.select(_db.creditorNodes)..where((c) => c.id.equals(id));

  SimpleSelectStatement<$TaxNodesTable, TaxNodeRow> _selectTaxNode() =>
      _db.select(_db.taxNodes)..limit(1);

  List<CreditorNode> _creditorsToDomain(List<CreditorNodeRow> rows) =>
      rows.map(_creditorToDomain).toList();

  CreditorNode? _creditorOrNull(CreditorNodeRow? row) =>
      row == null ? null : _creditorToDomain(row);

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

  CreditorPayment _paymentToDomain(CreditorPaymentRow row) => CreditorPayment(
    id: row.id,
    creditorId: row.creditorId,
    receiptNumber: row.receiptNumber,
    amountFcfa: row.amountFcfa,
    method: row.method,
    reason: row.reason,
    date: row.date,
    remainingAfterFcfa: row.remainingAfterFcfa,
    creditorName: row.creditorName,
    creditorPhone: row.creditorPhone,
  );

  TaxNode _taxOrInitial(TaxNodeRow? row) => row == null
      ? TaxNode.initial()
      : TaxNode(
          id: row.id,
          rateBasisPoints: row.rateBasisPoints,
          savedBalanceFcfa: row.savedBalanceFcfa,
          nextDueDate: row.nextDueDate,
        );
}
