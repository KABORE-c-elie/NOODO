import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

const _sentence =
    "j'ai vendu 2 tas de 1000 F et j'ai dépensé 3000 F pour le transport";

List<String> _amounts(WidgetTester tester) => [
  for (final element
      in find
          .descendant(
            of: find.widgetWithText(TextFormField, frenchL10n.amountLabel),
            matching: find.byType(EditableText),
          )
          .evaluate())
    (element.widget as EditableText).controller.text,
];

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() => db = createMemoryDatabase());

  testWidgets(
    'une carte par transaction, calcul du prix unitaire, tout enregistrer',
    (tester) async {
      await pumpNoodoApp(
        tester,
        db: db,
        now: now,
        initialLocation: AppRoutes.confirmationPath(_sentence),
      );

      expect(find.text(frenchL10n.transactionNumber(1, 2)), findsOneWidget);
      expect(
        find.text(frenchL10n.priceCalculation('2', 1000, 2000)),
        findsOneWidget,
      );
      expect(_amounts(tester), ['2000', '3000']);

      await scrollTo(tester, buttonWithText(frenchL10n.saveAll));
      await tester.tap(buttonWithText(frenchL10n.saveAll));
      await tester.pumpAndSettle();

      expect(
        find.text(frenchL10n.transactionsSavedWithTax(2, 100)),
        findsOneWidget,
      );
      final saved = await tester.runAsync(
        () =>
            DriftTransactionRepository(db)
                .listInRange(DateRange.of(PeriodUnit.day, now)),
      );
      expect(saved!.map((t) => (t.type, t.amountFcfa, t.category)).toSet(), {
        (TransactionType.sale, 2000, TransactionCategory.other),
        (TransactionType.expense, 3000, TransactionCategory.transport),
      });
      final taxNode = await tester.runAsync(DriftNodeRepository(db).getTaxNode);
      expect(taxNode!.savedBalanceFcfa, 100);

      await unmountApp(tester, db);
    },
  );

  testWidgets('basculer en prix total puis retirer une carte', (tester) async {
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.confirmationPath(_sentence),
    );

    await tester.tap(find.text(frenchL10n.priceBasisTotal));
    await tester.pumpAndSettle();
    expect(_amounts(tester).first, '1000');
    expect(
      find.text(frenchL10n.priceCalculation('2', 1000, 2000)),
      findsNothing,
    );

    await tester.tap(find.text(frenchL10n.priceBasisUnit));
    await tester.pumpAndSettle();
    expect(_amounts(tester).first, '2000');

    await tester.tap(find.byTooltip(frenchL10n.removeTransaction).first);
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.transactionNumber(1, 2)), findsNothing);
    expect(find.byTooltip(frenchL10n.removeTransaction), findsNothing);
    await scrollTo(tester, buttonWithText(frenchL10n.save));
    expect(buttonWithText(frenchL10n.saveAll), findsNothing);
    expect(_amounts(tester), ['3000']);

    await unmountApp(tester, db);
  });
}
