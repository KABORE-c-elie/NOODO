import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:noodo/app.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';
import 'package:noodo/features/nodes/presentation/screens/creditor_screen.dart';
import 'package:noodo/features/receipts/data/photo_providers.dart';
import 'package:noodo/features/transactions/data/speech_providers.dart';
import 'package:noodo/features/transactions/presentation/screens/history_screen.dart';

import '../test/helpers/fake_photo_storage.dart';
import '../test/helpers/fake_receipt_sharer.dart';
import '../test/helpers/fake_reminder_scheduler.dart';
import '../test/helpers/fake_speech_service.dart';
import '../test/helpers/fixtures.dart';

final _fr = lookupAppLocalizations(const Locale('fr'));
final _en = lookupAppLocalizations(const Locale('en'));

Future<void> _pumpApp(
  WidgetTester tester, {
  required AppDatabase db,
  required FakeSpeechService speech,
  required FakeReceiptSharer sharer,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        speechServiceProvider.overrideWithValue(speech),
        receiptSharerProvider.overrideWithValue(sharer),
        reminderSchedulerProvider.overrideWithValue(FakeReminderScheduler()),
        photoStorageProvider.overrideWith((ref) async => FakePhotoStorage()),
      ],
      child: const NoodoApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _tapNav(WidgetTester tester, String label) async {
  await tester.tap(
    find.descendant(of: find.byType(NavigationBar), matching: find.text(label)),
  );
  await tester.pumpAndSettle();
}

Future<void> _scrollTo(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    200,
    scrollable: find.byType(Scrollable).hitTestable().first,
  );
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;
  late FakeSpeechService speech;
  late FakeReceiptSharer sharer;

  setUp(() {
    db = createMemoryDatabase();
    speech = FakeSpeechService();
    sharer = FakeReceiptSharer();
  });

  tearDown(() => db.close());

  testWidgets(
    'parcours vente : dictée, enregistrement, résumé, historique, impôts',
    (tester) async {
      await _pumpApp(tester, db: db, speech: speech, sharer: sharer);
      expect(find.text(_fr.todayEarned(0)), findsOneWidget);

      await tester.tap(find.byTooltip(_fr.recordTransaction));
      await tester.pump(const Duration(milliseconds: 300));
      speech.emitPartial("j'ai vendu deux tas");
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text("j'ai vendu deux tas"), findsOneWidget);
      speech.emitFinal("j'ai vendu deux tas de tomates à 1000 francs");
      await tester.pumpAndSettle();

      expect(find.text(_fr.confirmationTitle), findsOneWidget);
      expect(find.text('tomates'), findsWidgets);
      expect(find.text('tas'), findsOneWidget);
      await _scrollTo(tester, find.text(_fr.save));
      await tester.tap(find.text(_fr.save));
      await tester.pumpAndSettle();

      expect(find.text(_fr.transactionSavedWithTax(50)), findsOneWidget);
      expect(find.text(_fr.todayEarned(1000)), findsOneWidget);

      await _tapNav(tester, _fr.navHistory);
      expect(
        find.descendant(
          of: find.byType(HistoryScreen),
          matching: find.text('tomates'),
        ),
        findsOneWidget,
      );
      expect(find.text(_fr.saleAmount(1000)), findsWidgets);

      await _tapNav(tester, _fr.navNodes);
      expect(find.text(_fr.taxSaved(50)), findsOneWidget);
    },
  );

  testWidgets(
    'parcours créancier : paiement, reçu, dépense verrouillée, passage en anglais',
    (tester) async {
      await _pumpApp(tester, db: db, speech: speech, sharer: sharer);

      await _tapNav(tester, _fr.navNodes);
      await tester.tap(find.byTooltip(_fr.addCreditorTooltip).first);
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, _fr.creditorNameLabel),
        'Maman Awa',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, _fr.creditorPhoneLabel),
        '+226 70 00 11 22',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, _fr.amountDueLabel),
        '7500',
      );
      await tester.tap(find.text(_fr.save));
      await tester.pumpAndSettle();
      expect(find.text('Maman Awa'), findsOneWidget);

      await tester.tap(find.text('Maman Awa'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip(_fr.recordPaymentTooltip));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, _fr.paymentAmountLabel),
        '3000',
      );
      await tester.tap(find.text(_fr.methodOrangeMoney));
      await tester.tap(find.text(_fr.confirmPayment).last);
      await tester.pumpAndSettle();

      final year = DateTime.now().year;
      expect(find.text(_fr.receiptTitle), findsOneWidget);
      expect(find.textContaining('Rec-$year-0001'), findsWidgets);
      await tester.tap(find.byTooltip(_fr.shareReceiptTooltip));
      await tester.pumpAndSettle();
      expect(sharer.shared.single.text, contains('Reste à devoir'));
      await tester.tap(find.text(_fr.close));
      await tester.pumpAndSettle();
      expect(find.text(_fr.balanceDue(4500)), findsOneWidget);
      expect(
        (await DriftNodeRepository(db).findCreditor(
          (await DriftNodeRepository(db).listCreditors()).single.id,
        ))!.balanceDueFcfa,
        4500,
      );

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      await _tapNav(tester, _fr.navHistory);
      final paymentTile = find.descendant(
        of: find.byType(HistoryScreen),
        matching: find.text('Maman Awa'),
      );
      expect(paymentTile, findsOneWidget);
      expect(find.byType(Dismissible), findsNothing);
      await tester.tap(paymentTile);
      await tester.pumpAndSettle();
      expect(find.byType(CreditorScreen), findsOneWidget);
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      await _tapNav(tester, _fr.navHome);
      await tester.tap(find.byTooltip(_fr.openSettings));
      await tester.pumpAndSettle();
      await tester.tap(find.text(_fr.languageEnglish));
      await tester.pumpAndSettle();
      expect(find.text(_en.settingsTitle), findsOneWidget);
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      expect(find.text(_en.homeTitle), findsWidgets);
      expect(find.text(_en.todayLost(3000)), findsOneWidget);
      expect(find.text(_en.navHistory), findsOneWidget);
    },
  );
}
