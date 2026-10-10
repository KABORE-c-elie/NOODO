import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/profits/presentation/screens/profits_screen.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() => db = createMemoryDatabase());

  Future<void> seed(WidgetTester tester) => tester.runAsync(() async {
    final repository = DriftTransactionRepository(db);
    await repository.add(
      sale(
        'lundi',
        10000,
        DateTime(2026, 10, 12, 9),
        category: TransactionCategory.vegetables,
      ),
    );
    await repository.add(
      expense(
        'taxi',
        2000,
        DateTime(2026, 10, 14, 8),
        category: TransactionCategory.transport,
      ),
    );
    await repository.add(
      sale(
        'riz',
        5000,
        DateTime(2026, 10, 14, 10),
        category: TransactionCategory.cereals,
      ),
    );
    await repository.add(sale('semaine-passee', 6000, DateTime(2026, 10, 7)));
  });

  testWidgets('semaine en cours : résumé, comparaison et catégories', (
    tester,
  ) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.profits,
    );

    expect(find.text(frenchL10n.weekEarned(13000)), findsOneWidget);
    expect(
      find.text(frenchL10n.previousMorePercent(7000, 117)),
      findsOneWidget,
    );
    expect(
      find.text(frenchL10n.periodRange('12 octobre', '18 octobre 2026')),
      findsOneWidget,
    );
    await scrollWithin<ProfitsScreen>(
      tester,
      find.bySemanticsLabel(
        frenchL10n.lossSemantics(frenchL10n.categoryTransport, 2000),
      ),
    );
    expect(
      find.bySemanticsLabel(
        frenchL10n.profitSemantics(frenchL10n.categoryVegetables, 10000),
      ),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(
        frenchL10n.lossSemantics(frenchL10n.categoryTransport, 2000),
      ),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(
        frenchL10n.profitSemantics('lundi 12 octobre', 10000),
      ),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(
        RegExp(
          '^${RegExp.escape(frenchL10n.chartSummary(frenchL10n.periodRange('12 octobre', '18 octobre 2026'), 13000, 'lundi 12 octobre', 10000))}',
        ),
      ),
      findsOneWidget,
    );

    await unmountApp(tester, db);
  });

  testWidgets('passage au jour puis navigation vers la veille et retour', (
    tester,
  ) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.profits,
    );

    await tester.tap(find.text(frenchL10n.periodDay));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.todayEarned(3000)), findsOneWidget);
    expect(find.text(frenchL10n.previousMore(3000)), findsOneWidget);
    expect(find.text('mercredi 14 octobre 2026'), findsOneWidget);
    final next = find.byTooltip(frenchL10n.periodNext);
    expect(
      tester
          .widget<IconButton>(
            find.ancestor(
              of: find.byIcon(Icons.chevron_right),
              matching: find.byType(IconButton),
            ),
          )
          .onPressed,
      isNull,
    );

    await tester.tap(find.byTooltip(frenchL10n.periodPrevious));
    await tester.pumpAndSettle();
    expect(
      find.text(frenchL10n.pastEarned('mardi 13 octobre 2026', 0)),
      findsOneWidget,
    );
    await scrollWithin<ProfitsScreen>(
      tester,
      find.text(frenchL10n.noDataForPeriod),
    );
    expect(find.text(frenchL10n.noDataForPeriod), findsOneWidget);
    await scrollWithin<ProfitsScreen>(tester, next, delta: -200);

    await tester.tap(next);
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.todayEarned(3000)), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('mois en cours', (tester) async {
    await seed(tester);
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.profits,
    );

    await tester.tap(find.text(frenchL10n.periodMonth));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.monthEarned(19000)), findsOneWidget);
    expect(find.text('octobre 2026'), findsOneWidget);

    await unmountApp(tester, db);
  });
}
