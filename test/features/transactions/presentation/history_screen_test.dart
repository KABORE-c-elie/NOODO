import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/amount_format.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/presentation/screens/history_screen.dart';
import 'package:noodo/features/transactions/presentation/widgets/history_filters.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

Finder _inHistory(Finder finder) => inScreen<HistoryScreen>(finder);

void main() {
  late AppDatabase db;
  late DriftTransactionRepository repository;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() {
    db = createMemoryDatabase();
    repository = DriftTransactionRepository(db);
  });

  Future<void> seed(WidgetTester tester) => tester.runAsync(() async {
    await repository.add(
      sale(
        'tomates',
        15000,
        DateTime(2026, 10, 14, 9),
        category: TransactionCategory.vegetables,
      ).copyWith(product: 'tomates'),
    );
    await repository.add(
      expense(
        'taxi',
        2500,
        DateTime(2026, 10, 14, 11),
        category: TransactionCategory.transport,
      ).copyWith(product: 'taxi'),
    );
    await repository.add(
      sale(
        'riz',
        8000,
        DateTime(2026, 10, 13, 10),
        category: TransactionCategory.cereals,
      ).copyWith(product: 'riz'),
    );
  });

  testWidgets('groupé par jour avec le bénéfice de chaque jour', (
    tester,
  ) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    expect(find.text('mercredi 14 octobre 2026'), findsOneWidget);
    expect(
      find.text(frenchL10n.dayProfit(formatAmount(12500, 'fr'))),
      findsOneWidget,
    );
    await scrollWithin<HistoryScreen>(
      tester,
      find.text('mardi 13 octobre 2026'),
    );
    await scrollWithin<HistoryScreen>(tester, _inHistory(find.text('riz')));
    expect(
      find.text(frenchL10n.dayProfit(formatAmount(8000, 'fr'))),
      findsOneWidget,
    );
    final order = ['taxi', 'tomates', 'riz']
        .map((label) => tester.getTopLeft(_inHistory(find.text(label))).dy)
        .toList();
    expect(order, [...order]..sort());

    await unmountApp(tester, db);
  });

  testWidgets('filtres par type puis par catégorie', (tester) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    await scrollWithin<HistoryFilters>(
      tester,
      find.text(frenchL10n.filterExpenses),
    );
    await tester.tap(find.text(frenchL10n.filterExpenses));
    await tester.pumpAndSettle();
    expect(_inHistory(find.text('taxi')), findsOneWidget);
    expect(_inHistory(find.text('tomates')), findsNothing);
    expect(_inHistory(find.text('riz')), findsNothing);

    await tester.tap(find.text(frenchL10n.filterSales));
    await tester.pumpAndSettle();
    await scrollWithin<HistoryFilters>(
      tester,
      find.text(frenchL10n.filters),
      delta: -200,
    );
    await tester.tap(find.text(frenchL10n.filters));
    await tester.pumpAndSettle();
    await tester.tap(find.text(frenchL10n.categoryCereals).last);
    await tester.pumpAndSettle();
    expect(_inHistory(find.text('riz')), findsOneWidget);
    expect(_inHistory(find.text('tomates')), findsNothing);
    expect(_inHistory(find.text('taxi')), findsNothing);

    await unmountApp(tester, db);
  });

  testWidgets('glisser pour supprimer, puis annuler', (tester) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    await tester.drag(_inHistory(find.text('tomates')), const Offset(-600, 0));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.deleteConfirmTitle), findsOneWidget);
    await tester.tap(find.text(frenchL10n.delete));
    await tester.pumpAndSettle();

    expect(_inHistory(find.text('tomates')), findsNothing);
    expect(find.text(frenchL10n.transactionDeleted), findsOneWidget);
    expect(
      find.text(frenchL10n.dayProfit(formatAmount(-2500, 'fr'))),
      findsOneWidget,
    );
    expect(await tester.runAsync(() => repository.findById('tomates')), isNull);

    await tester.tap(find.text(frenchL10n.undo));
    await tester.pumpAndSettle();

    expect(_inHistory(find.text('tomates')), findsOneWidget);
    expect(
      find.text(frenchL10n.dayProfit(formatAmount(12500, 'fr'))),
      findsOneWidget,
    );
    expect(
      await tester.runAsync(() => repository.findById('tomates')),
      isNotNull,
    );

    await unmountApp(tester, db);
  });

  testWidgets('refuser la confirmation garde la transaction', (tester) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    await scrollWithin<HistoryScreen>(tester, _inHistory(find.text('riz')));
    await tester.drag(_inHistory(find.text('riz')), const Offset(-600, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.text(frenchL10n.cancel));
    await tester.pumpAndSettle();

    expect(_inHistory(find.text('riz')), findsOneWidget);
    expect(await tester.runAsync(() => repository.findById('riz')), isNotNull);

    await unmountApp(tester, db);
  });

  testWidgets('appui sur une ligne : modification pré-remplie et enregistrée', (
    tester,
  ) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    await tester.tap(_inHistory(find.text('tomates')));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.editTransactionTitle), findsOneWidget);
    final amountField = find.widgetWithText(
      TextFormField,
      frenchL10n.amountLabel,
    );
    expect(
      tester
          .widget<EditableText>(
            find.descendant(
              of: amountField,
              matching: find.byType(EditableText),
            ),
          )
          .controller
          .text,
      '15000',
    );

    await tester.enterText(amountField, '20000');
    await scrollTo(tester, buttonWithText(frenchL10n.save));
    await tester.tap(buttonWithText(frenchL10n.save));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.transactionUpdated), findsOneWidget);
    expect(find.text(frenchL10n.saleAmount(20000)), findsOneWidget);
    expect(
      find.text(frenchL10n.dayProfit(formatAmount(17500, 'fr'))),
      findsOneWidget,
    );
    final updated = await tester.runAsync(() => repository.findById('tomates'));
    expect(updated!.amountFcfa, 20000);
    expect(updated.date, DateTime(2026, 10, 14, 9));
    expect(updated.category, TransactionCategory.vegetables);

    await unmountApp(tester, db);
  });

  testWidgets('chargement par pages au défilement', (tester) async {
    await tester.runAsync(() async {
      for (var i = 0; i < 70; i++) {
        await repository.add(
          sale('v$i', 100 + i, DateTime(2026, 10, 14, 0, i)),
        );
      }
    });
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.history,
    );

    expect(_inHistory(find.text('vente v69')), findsOneWidget);
    await tester.scrollUntilVisible(
      _inHistory(find.text('vente v0')),
      500,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .last,
      maxScrolls: 100,
    );
    await tester.pumpAndSettle();

    expect(_inHistory(find.text('vente v0')), findsOneWidget);

    await unmountApp(tester, db);
  });
}
