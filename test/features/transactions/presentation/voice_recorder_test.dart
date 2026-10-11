import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';

import '../../../helpers/fake_speech_service.dart';
import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

String _transcript(WidgetTester tester) => tester
    .widget<TextField>(
      find.widgetWithText(TextField, frenchL10n.transcriptLabel),
    )
    .controller!
    .text;

void main() {
  late AppDatabase db;
  late FakeSpeechService speech;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() {
    db = createMemoryDatabase();
    speech = FakeSpeechService();
  });

  testWidgets(
    'écoute réussie : texte partiel puis ouverture de la Confirmation',
    (tester) async {
      await pumpNoodoApp(tester, db: db, now: now, speech: speech);

      await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
      await tester.pump();
      expect(speech.listenedLanguages, ['fr']);
      expect(find.text(frenchL10n.listening), findsOneWidget);
      expect(find.byTooltip(frenchL10n.stopListening), findsOneWidget);

      speech.emitPartial("J'ai vendu 2 tas");
      await tester.pump();
      expect(find.text("J'ai vendu 2 tas"), findsOneWidget);

      const sentence = "J'ai vendu 2 tas de tomates à 1 000 francs";
      speech.emitFinal(sentence);
      await tester.pumpAndSettle();

      expect(find.text(frenchL10n.confirmationTitle), findsOneWidget);
      expect(_transcript(tester), sentence);
      expect(find.text('tomates'), findsWidgets);

      await unmountApp(tester, db);
    },
  );

  testWidgets('un second appui arrête l\'écoute et garde le texte entendu', (
    tester,
  ) async {
    await pumpNoodoApp(tester, db: db, now: now, speech: speech);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pump();
    speech.emitPartial("J'ai payé 500 F de taxi");
    await tester.pump();
    await tester.tap(find.byTooltip(frenchL10n.stopListening));
    await tester.pumpAndSettle();

    expect(speech.stopCalls, 1);
    expect(_transcript(tester), "J'ai payé 500 F de taxi");

    await unmountApp(tester, db);
  });

  testWidgets('permission refusée : message et saisie manuelle', (
    tester,
  ) async {
    speech.availability = SpeechAvailability.permissionDenied;
    await pumpNoodoApp(tester, db: db, now: now, speech: speech);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.speechPermissionDenied), findsOneWidget);
    expect(speech.listenedLanguages, isEmpty);

    await tester.tap(find.byTooltip(frenchL10n.manualEntryTooltip));
    await tester.pumpAndSettle();
    expect(find.text(frenchL10n.confirmationTitle), findsOneWidget);
    expect(_transcript(tester), isEmpty);

    await unmountApp(tester, db);
  });

  testWidgets('reconnaissance indisponible : message et saisie manuelle', (
    tester,
  ) async {
    speech.availability = SpeechAvailability.unavailable;
    await pumpNoodoApp(tester, db: db, now: now, speech: speech);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.speechUnavailable), findsOneWidget);
    expect(find.byTooltip(frenchL10n.manualEntryTooltip), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('erreur réseau pendant l\'écoute : même message', (tester) async {
    await pumpNoodoApp(tester, db: db, now: now, speech: speech);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pump();
    speech.emitFailure(SpeechFailure.unavailable);
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.speechUnavailable), findsOneWidget);
    expect(find.byTooltip(frenchL10n.recordTransaction), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('rien entendu : message, on peut réessayer', (tester) async {
    await pumpNoodoApp(tester, db: db, now: now, speech: speech);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pump();
    speech.emitFinal('');
    await tester.pumpAndSettle();

    expect(find.text(frenchL10n.speechNoSpeech), findsOneWidget);
    expect(find.text(frenchL10n.confirmationTitle), findsNothing);

    await tester.tap(find.byTooltip(frenchL10n.recordTransaction));
    await tester.pump();
    expect(find.text(frenchL10n.speechNoSpeech), findsNothing);
    expect(speech.listenedLanguages, ['fr', 'fr']);

    await unmountApp(tester, db);
  });
}
