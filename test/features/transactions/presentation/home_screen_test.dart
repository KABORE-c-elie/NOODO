import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() => db = createMemoryDatabase());

  testWidgets('affiche le résumé du jour, la comparaison et les transactions', (
    tester,
  ) async {
    final repository = DriftTransactionRepository(db);
    await tester.runAsync(() async {
      await repository.add(
        sale(
          'v1',
          15000,
          DateTime(2026, 10, 14, 9),
          category: TransactionCategory.vegetables,
        ).copyWith(product: 'tomates'),
      );
      await repository.add(
        expense(
          'd1',
          2500,
          DateTime(2026, 10, 14, 11),
        ).copyWith(product: 'transport'),
      );
      await repository.add(sale('hier', 10000, DateTime(2026, 10, 13, 10)));
    });

    await pumpNoodoApp(tester, db: db, now: now);

    expect(find.text(frenchL10n.todayEarned(12500)), findsOneWidget);
    expect(find.text(frenchL10n.comparedMore(2500)), findsOneWidget);
    expect(find.text('tomates'), findsOneWidget);
    expect(find.text(frenchL10n.saleAmount(15000)), findsOneWidget);
    expect(find.text(frenchL10n.expenseAmount(2500)), findsOneWidget);
    expect(
      find.bySemanticsLabel(
        frenchL10n.transactionSemantics(
          frenchL10n.transactionTypeSale,
          'tomates',
          15000,
        ),
      ),
      findsOneWidget,
    );
    expect(find.byTooltip(frenchL10n.recordTransaction), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('journée vide : gain nul et invitation à dicter', (tester) async {
    await pumpNoodoApp(tester, db: db, now: now);

    expect(find.text(frenchL10n.todayEarned(0)), findsOneWidget);
    expect(find.text(frenchL10n.comparedSame), findsOneWidget);
    expect(find.text(frenchL10n.noTransactions), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('photothèque et paramètres accessibles depuis l\'accueil', (
    tester,
  ) async {
    await pumpNoodoApp(tester, db: db, now: now);

    await tester.tap(find.byTooltip(frenchL10n.openSettings));
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(AppBar, frenchL10n.settingsTitle),
      findsOneWidget,
    );

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip(frenchL10n.openReceipts));
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(AppBar, frenchL10n.receiptsTitle),
      findsOneWidget,
    );

    await unmountApp(tester, db);
  });
}
