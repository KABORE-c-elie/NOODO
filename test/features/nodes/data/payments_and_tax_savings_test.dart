import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftNodeRepository nodes;
  late DriftTransactionRepository transactions;
  final day = DateTime(2026, 10, 14, 10);

  setUp(() {
    db = createMemoryDatabase();
    nodes = DriftNodeRepository(db);
    transactions = DriftTransactionRepository(db);
  });

  tearDown(() => db.close());

  Future<int> savedTax() async => (await nodes.getTaxNode()).savedBalanceFcfa;

  group('paiement d\'un créancier', () {
    const awa = CreditorNode(
      id: 'awa',
      supplierName: 'Maman Awa',
      phone: '+226 70 00 11 22',
      balanceDueFcfa: 7500,
    );

    PaymentRequest request(
      String id,
      int amount, {
      DateTime? date,
      PaymentMethod method = PaymentMethod.orangeMoney,
    }) => PaymentRequest(
      paymentId: id,
      transactionId: 'tx-$id',
      creditorId: 'awa',
      amountFcfa: amount,
      method: method,
      reason: 'Avance',
      date: date ?? day,
      expenseText: 'Paiement à Maman Awa',
    );

    setUp(() => nodes.addCreditor(awa));

    test('réduit le solde, crée la dépense et le reçu', () async {
      final payment = await nodes.recordPayment(request('p1', 5000));

      expect(payment.receiptNumber, 'Rec-2026-0001');
      expect(payment.remainingAfterFcfa, 2500);
      expect(payment.creditorName, 'Maman Awa');
      expect(payment.creditorPhone, '+226 70 00 11 22');
      expect((await nodes.findCreditor('awa'))!.balanceDueFcfa, 2500);

      final expense = await transactions.findById('tx-p1');
      expect(expense!.type, TransactionType.expense);
      expect(expense.amountFcfa, 5000);
      expect(expense.product, 'Maman Awa');
      expect(expense.rawText, 'Paiement à Maman Awa');
      expect(await nodes.watchPayments('awa').first, [payment]);
    });

    test('numérotation séquentielle, remise à zéro chaque année', () async {
      final first = await nodes.recordPayment(request('p1', 1000));
      final second = await nodes.recordPayment(request('p2', 1000));
      final nextYear = await nodes.recordPayment(
        request('p3', 1000, date: DateTime(2027, 1, 2)),
      );

      expect(first.receiptNumber, 'Rec-2026-0001');
      expect(second.receiptNumber, 'Rec-2026-0002');
      expect(nextYear.receiptNumber, 'Rec-2027-0001');
    });

    test('paiement complet : solde à zéro', () async {
      final payment = await nodes.recordPayment(request('p1', 7500));

      expect(payment.remainingAfterFcfa, 0);
      expect((await nodes.findCreditor('awa'))!.balanceDueFcfa, 0);
    });

    test('montant supérieur au solde : refusé sans rien modifier', () async {
      await expectLater(
        nodes.recordPayment(request('p1', 8000)),
        throwsRangeError,
      );

      expect((await nodes.findCreditor('awa'))!.balanceDueFcfa, 7500);
      expect(await transactions.findById('tx-p1'), isNull);
      expect(await nodes.watchPayments('awa').first, isEmpty);
      final payment = await nodes.recordPayment(request('p2', 1000));
      expect(payment.receiptNumber, 'Rec-2026-0001');
    });

    test('créancier inconnu', () {
      expect(
        () => nodes.recordPayment(
          request('p1', 1000).copyWith(creditorId: 'inconnu'),
        ),
        throwsStateError,
      );
    });

    test('supprimer le créancier supprime ses paiements', () async {
      await nodes.recordPayment(request('p1', 1000));

      await nodes.deleteCreditor('awa');

      expect(await nodes.watchPayments('awa').first, isEmpty);
      expect(await transactions.findById('tx-p1'), isNotNull);
    });
  });

  group('épargne impôts automatique', () {
    test('une vente met de côté 5 % arrondi à l\'entier inférieur', () async {
      final result = await transactions.add(sale('v1', 1050, day));

      expect(result.taxSavedFcfa, 52);
      expect(await savedTax(), 52);
    });

    test('une dépense ne met rien de côté', () async {
      final result = await transactions.add(expense('d1', 3000, day));

      expect(result.taxSavedFcfa, 0);
      expect(await savedTax(), 0);
    });

    test('le taux actuel du nœud impôts est utilisé', () async {
      final taxNode = await nodes.getTaxNode();
      await nodes.updateTaxNode(taxNode.copyWith(rateBasisPoints: 200));

      await transactions.add(sale('v1', 1000, day));

      expect(await savedTax(), 20);
    });

    test('modifier le montant corrige le solde', () async {
      await transactions.add(sale('v1', 1000, day));
      await transactions.add(sale('v2', 2000, day));
      expect(await savedTax(), 150);

      await transactions.update(sale('v1', 3000, day));

      expect(await savedTax(), 250);
    });

    test('transformer une vente en dépense retire sa part', () async {
      await transactions.add(sale('v1', 1000, day));

      await transactions.update(expense('v1', 1000, day));

      expect(await savedTax(), 0);
    });

    test('supprimer une vente retire sa part, annuler la remet', () async {
      final vente = sale('v1', 2000, day);
      await transactions.add(vente);
      await transactions.add(sale('v2', 1000, day));

      await transactions.delete('v1');
      expect(await savedTax(), 50);

      await transactions.add(vente);
      expect(await savedTax(), 150);
    });

    test('le solde ne descend jamais sous zéro', () async {
      await transactions.add(sale('v1', 2000, day));
      final taxNode = await nodes.getTaxNode();
      await nodes.updateTaxNode(taxNode.copyWith(savedBalanceFcfa: 30));

      await transactions.delete('v1');

      expect(await savedTax(), 0);
    });

    test('vente et épargne dans la même transaction : tout ou rien', () async {
      await transactions.add(sale('v1', 1000, day));

      await expectLater(
        transactions.add(sale('v1', 5000, day)),
        throwsA(anything),
      );

      expect(await savedTax(), 50);
      final stored = await transactions.listInRange(
        DateRange.of(PeriodUnit.day, day),
      );
      expect(stored.single.amountFcfa, 1000);
    });
  });
}
