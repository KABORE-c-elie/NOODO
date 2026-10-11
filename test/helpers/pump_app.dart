import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/app.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_router.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/transactions/data/speech_providers.dart';

import 'fake_photo_storage.dart';
import 'fake_receipt_sharer.dart';
import 'fake_reminder_scheduler.dart';
import 'fake_speech_service.dart';

const testLocale = Locale('fr');

const phoneSize = Size(360, 800);

final frenchL10n = lookupAppLocalizations(testLocale);

Future<ProviderContainer> pumpNoodoApp(
  WidgetTester tester, {
  required AppDatabase db,
  required DateTime now,
  String? initialLocation,
  FakeSpeechService? speech,
  FakeReceiptSharer? sharer,
  FakeReminderScheduler? reminders,
  FakePhotoStorage? photos,
}) async {
  tester.view
    ..physicalSize = phoneSize * 3
    ..devicePixelRatio = 3;
  tester.platformDispatcher.localesTestValue = const [testLocale];
  addTearDown(tester.view.reset);
  addTearDown(tester.platformDispatcher.clearLocalesTestValue);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => now),
        speechServiceProvider.overrideWithValue(speech ?? FakeSpeechService()),
        receiptSharerProvider.overrideWithValue(sharer ?? FakeReceiptSharer()),
        reminderSchedulerProvider.overrideWithValue(
          reminders ?? FakeReminderScheduler(),
        ),
        photoStorageProvider.overrideWith(
          (ref) async => photos ?? FakePhotoStorage(),
        ),
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

Finder inScreen<T extends Widget>(Finder finder) =>
    find.descendant(of: find.byType(T), matching: finder);

Future<void> scrollWithin<T extends Widget>(
  WidgetTester tester,
  Finder finder, {
  double delta = 200,
}) => tester.scrollUntilVisible(
  finder,
  delta,
  scrollable: inScreen<T>(find.byType(Scrollable)).first,
);
