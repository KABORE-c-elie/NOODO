import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/presentation/screens/creditor_screen.dart';
import 'package:noodo/features/nodes/presentation/screens/nodes_screen.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

import '../../../helpers/fake_receipt_sharer.dart';
import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  late DriftNodeRepository nodes;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() {
    db = createMemoryDatabase();
    nodes = DriftNodeRepository(db);
  });

  testWidgets('carte impôts et badge « en retard » selon l\'échéance', (
    tester,
  ) async {
    await tester.runAsync(() async {
      await DriftTransactionRepository(db).add(sale('v1', 2000, now));
      await nodes.addCreditor(
        CreditorNode(
          id: 'awa',
          supplierName: 'Maman Awa',
          balanceDueFcfa: 7500,
          dueDate: DateTime(2026, 10, 10),
        ),
      );
      await nodes.addCreditor(
        CreditorNode(
          id: 'amadou',
          supplierName: 'Monsieur Amadou',
          balanceDueFcfa: 2000,
          dueDate: DateTime(2026, 10, 20),
        ),
      );
      await nodes.addCreditor(
        CreditorNode(
          id: 'solde',
          supplierName: 'Fournisseur soldé',
          balanceDueFcfa: 0,
          dueDate: DateTime(2026, 10, 1),
        ),
      );
    });
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.nodes,
    );

    expect(find.text(frenchL10n.taxSaved(100)), findsOneWidget);
    expect(find.text(frenchL10n.taxRate('5')), findsOneWidget);
    expect(find.text(frenchL10n.taxNoDue), findsOneWidget);

    await scrollWithin<NodesScreen>(tester, find.text('Fournisseur soldé'));
    expect(find.text(frenchL10n.overdue), findsOneWidget);
    expect(
      find.ancestor(
        of: find.text(frenchL10n.overdue),
        matching: find.widgetWithText(ListTile, 'Maman Awa'),
      ),
      findsOneWidget,
    );
    final names = [
      'Fournisseur soldé',
      'Maman Awa',
      'Monsieur Amadou',
    ].map((name) => tester.getTopLeft(find.text(name)).dy).toList();
    expect(names, [...names]..sort());

    await unmountApp(tester, db);
  });

  testWidgets('ajout d\'un créancier', (tester) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.nodes,
    );
    expect(find.text(frenchL10n.noCreditors), findsOneWidget);

    await tester.tap(find.byTooltip(frenchL10n.addCreditorTooltip).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text(frenchL10n.save));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.requiredField), findsOneWidget);
    expect(find.text(frenchL10n.invalidAmount), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.creditorNameLabel),
      'Maman Awa',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.creditorPhoneLabel),
      '+226 70 00 11 22',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.amountDueLabel),
      '7500',
    );
    await tester.tap(find.text(frenchL10n.save));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.creditorAdded), findsOneWidget);
    expect(find.text('Maman Awa'), findsOneWidget);
    final saved = await tester.runAsync(nodes.listCreditors);
    expect(saved!.single.phone, '+226 70 00 11 22');
    expect(saved.single.balanceDueFcfa, 7500);
    expect(saved.single.dueDate, isNull);

    await unmountApp(tester, db);
  });

  testWidgets('paiement : solde réduit, reçu partagé, dépense créée', (
    tester,
  ) async {
    final sharer = FakeReceiptSharer();
    await tester.runAsync(
      () => nodes.addCreditor(
        const CreditorNode(
          id: 'awa',
          supplierName: 'Maman Awa',
          phone: '+226 70 00 11 22',
          balanceDueFcfa: 7500,
        ),
      ),
    );
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      sharer: sharer,
      initialLocation: AppRoutes.nodes,
    );

    await tester.tap(find.text('Maman Awa'));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.balanceDue(7500)), findsOneWidget);
    expect(find.text(frenchL10n.totalPaid(0)), findsOneWidget);

    await tester.tap(find.byTooltip(frenchL10n.recordPaymentTooltip));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.paymentAmountLabel),
      '9000',
    );
    await tester.tap(find.text(frenchL10n.confirmPayment).last);
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.amountTooHigh(7500)), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.paymentAmountLabel),
      '5000',
    );
    await tester.tap(find.text(frenchL10n.methodOrangeMoney));
    await tester.enterText(
      find.widgetWithText(TextFormField, frenchL10n.paymentReasonLabel),
      'Avance sur livraison',
    );
    await tester.tap(find.text(frenchL10n.confirmPayment).last);
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.receiptTitle), findsOneWidget);
    expect(find.textContaining('Rec-2026-0001'), findsWidgets);
    await tester.tap(find.byTooltip(frenchL10n.shareReceiptTooltip));
    await tester.pumpAndSettle();
    expect(sharer.shared, hasLength(1));
    expect(sharer.shared.single.subject, 'Reçu Rec-2026-0001');
    expect(
      sharer.shared.single.text,
      contains('Moyen : Mobile Money (Orange Money)'),
    );
    expect(sharer.shared.single.text, contains('Motif : Avance sur livraison'));

    await tester.tap(find.text(frenchL10n.close));
    await tester.pumpAndSettle();
    final summary = find.descendant(
      of: find.byType(CreditorScreen),
      matching: find.text(frenchL10n.balanceDue(2500)),
    );
    expect(summary, findsOneWidget);
    expect(find.text(frenchL10n.totalPaid(5000)), findsOneWidget);
    expect(find.text(frenchL10n.amountFcfa(5000)), findsOneWidget);

    final expenses = await tester.runAsync(
      () =>
          DriftTransactionRepository(db)
              .listInRange(DateRange.of(PeriodUnit.day, now)),
    );
    expect(expenses!.single.type, TransactionType.expense);
    expect(expenses.single.amountFcfa, 5000);

    await unmountApp(tester, db);
  });
}
