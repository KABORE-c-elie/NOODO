import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/data/drift_unit_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

String _fieldText(WidgetTester tester, String label) => tester
    .widget<EditableText>(
      find.descendant(
        of: find.widgetWithText(TextFormField, label),
        matching: find.byType(EditableText),
      ),
    )
    .controller
    .text;

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() => db = createMemoryDatabase());

  testWidgets('analyse une phrase et pré-remplit les champs', (tester) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.confirmationPath(
        "J'ai vendu 2 tas de tomates à 1 000 francs",
      ),
    );

    expect(_fieldText(tester, frenchL10n.amountLabel), '1000');
    expect(_fieldText(tester, frenchL10n.quantityLabel), '2');
    expect(_fieldText(tester, frenchL10n.productLabel), 'tomates');
    expect(find.text('tas'), findsOneWidget);
    expect(find.text(frenchL10n.categoryVegetables), findsOneWidget);
    expect(find.text(frenchL10n.lowConfidenceWarning), findsNothing);
    expect(find.text(frenchL10n.fieldToCheck), findsNothing);

    await unmountApp(tester, db);
  });

  testWidgets('confiance basse : type et montant mis en évidence', (
    tester,
  ) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.confirmationPath('des tomates'),
    );

    expect(find.text(frenchL10n.lowConfidenceWarning), findsOneWidget);
    expect(find.text(frenchL10n.fieldToCheck), findsNWidgets(2));
    await scrollTo(tester, buttonWithText(frenchL10n.save));
    final save = tester.widget<ButtonStyleButton>(
      buttonWithText(frenchL10n.save),
    );
    expect(save.onPressed, isNull);
    await tester.drag(pageScrollable, const Offset(0, 2000));
    await tester.pumpAndSettle();

    await tester.tap(find.text(frenchL10n.transactionTypeExpense));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.fieldToCheck), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('saisie manuelle puis analyse', (tester) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.confirmationPath(),
    );
    expect(find.text(frenchL10n.amountLabel), findsNothing);

    await tester.enterText(
      find.widgetWithText(TextField, frenchL10n.transcriptLabel),
      "J'ai payé 3 000 FCFA de transport",
    );
    await tester.tap(find.byTooltip(frenchL10n.analyzeTooltip));
    await tester.pumpAndSettle();

    expect(_fieldText(tester, frenchL10n.amountLabel), '3000');
    expect(find.text(frenchL10n.categoryTransport), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('unité inconnue : « Ajouter cette unité » l\'enregistre', (
    tester,
  ) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.confirmationPath(
        "J'ai acheté 2 bidons d'huile à 4 000 F",
      ),
    );

    expect(find.text(frenchL10n.unknownUnit('bidons')), findsOneWidget);
    await tester.tap(find.byTooltip(frenchL10n.addUnitTooltip('bidons')));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.unknownUnit('bidons')), findsNothing);
    expect(find.text(frenchL10n.unitAdded('bidon')), findsOneWidget);
    final units = await tester.runAsync(
      () => DriftUnitRepository(db).listAll(),
    );
    expect(units!.map((u) => u.name), contains('bidon'));

    await unmountApp(tester, db);
  });

  testWidgets('enregistrer crée la transaction et revient à l\'accueil', (
    tester,
  ) async {
    await pumpNoodoApp(tester, db: db, now: now);
    await tester.tap(find.byTooltip(frenchL10n.manualEntryTooltip));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextField, frenchL10n.transcriptLabel),
      "J'ai vendu 3 bottes d'oseille à 1 500 F",
    );
    await tester.tap(find.byTooltip(frenchL10n.analyzeTooltip));
    await tester.pumpAndSettle();
    await scrollTo(tester, buttonWithText(frenchL10n.save));
    await tester.tap(buttonWithText(frenchL10n.save));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.transactionSavedWithTax(75)), findsOneWidget);
    expect(find.text(frenchL10n.todayEarned(1500)), findsOneWidget);
    expect(find.text('oseille'), findsOneWidget);

    final saved = await tester.runAsync(
      () =>
          DriftTransactionRepository(db)
              .listInRange(DateRange.of(PeriodUnit.day, now)),
    );
    expect(saved!.single.type, TransactionType.sale);
    expect(saved.single.amountFcfa, 1500);
    expect(saved.single.quantity, 3);
    expect(saved.single.unit?.name, 'botte');
    expect(saved.single.category, TransactionCategory.vegetables);
    expect(saved.single.date, now);

    await unmountApp(tester, db);
  });
}
