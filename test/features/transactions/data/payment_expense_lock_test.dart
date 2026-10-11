import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftTransactionRepository transactions;
  final day = DateTime(2026, 10, 14, 10);

  setUp(() async {
    db = createMemoryDatabase();
    transactions = DriftTransactionRepository(db);
    final nodes = DriftNodeRepository(db);
    await nodes.addCreditor(
      const CreditorNode(
        id: 'awa',
        supplierName: 'Maman Awa',
        balanceDueFcfa: 5000,
      ),
    );
    await nodes.recordPayment(
      PaymentRequest(
        paymentId: 'p1',
        transactionId: 'tx-p1',
        creditorId: 'awa',
        amountFcfa: 2000,
        method: PaymentMethod.cash,
        date: day,
        expenseText: 'Paiement à Maman Awa',
      ),
    );
  });

  tearDown(() => db.close());

  test('la dépense connaît le créancier du paiement', () async {
    final expense = await transactions.findById('tx-p1');

    expect(expense!.paymentCreditorId, 'awa');
    expect(expense.isCreditorPayment, isTrue);
  });

  test('une transaction ordinaire n\'est liée à aucun paiement', () async {
    await transactions.add(sale('v1', 1000, day));

    expect((await transactions.findById('v1'))!.isCreditorPayment, isFalse);
  });

  test('modification et suppression refusées', () async {
    final expense = (await transactions.findById('tx-p1'))!;

    await expectLater(
      transactions.update(expense.copyWith(amountFcfa: 1)),
      throwsStateError,
    );
    await expectLater(transactions.delete('tx-p1'), throwsStateError);
    expect((await transactions.findById('tx-p1'))!.amountFcfa, 2000);
  });
}
