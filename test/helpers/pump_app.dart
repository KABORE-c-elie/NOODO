import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/app.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_router.dart';
import 'package:noodo/core/utils/clock_provider.dart';

final frenchL10n = lookupAppLocalizations(const Locale('fr'));

Future<ProviderContainer> pumpNoodoApp(
  WidgetTester tester, {
  required AppDatabase db,
  required DateTime now,
  String? initialLocation,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => now),
      ],
      child: const NoodoApp(),
    ),
  );
  final container = ProviderScope.containerOf(
    tester.element(find.byType(NoodoApp)),
  );
  if (initialLocation != null) {
    container.read(appRouterProvider).go(initialLocation);
  }
  await tester.pumpAndSettle();
  return container;
}

Future<void> unmountApp(WidgetTester tester, AppDatabase db) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pumpAndSettle();
  await tester.runAsync(db.close);
}

final pageScrollable = find
    .descendant(of: find.byType(ListView), matching: find.byType(Scrollable))
    .first;

Future<void> scrollTo(WidgetTester tester, Finder finder) =>
    tester.scrollUntilVisible(finder, 200, scrollable: pageScrollable);

Finder buttonWithText(String text) => find.ancestor(
  of: find.text(text),
  matching: find.byWidgetPredicate((widget) => widget is ButtonStyleButton),
);
