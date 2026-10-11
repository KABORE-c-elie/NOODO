import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/transactions/data/speech_providers.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:noodo/features/transactions/presentation/voice/listening_controller.dart';

import '../../../helpers/fake_speech_service.dart';

void main() {
  late FakeSpeechService speech;
  late ProviderContainer container;

  ListeningState state() => container.read(listeningControllerProvider);
  ListeningController controller() =>
      container.read(listeningControllerProvider.notifier);

  setUp(() {
    speech = FakeSpeechService();
    container = ProviderContainer.test(
      overrides: [
        speechServiceProvider.overrideWithValue(speech),
        appLocaleProvider.overrideWithValue(const Locale('fr')),
      ],
    );
    container.listen(listeningControllerProvider, (_, _) {});
  });

  test('état initial au repos', () {
    expect(state(), const ListeningState());
    expect(state().isActive, isFalse);
  });

  test('démarre l\'écoute dans la langue de l\'app', () async {
    await controller().start();

    expect(state().phase, ListeningPhase.listening);
    expect(speech.listenedLanguages, ['fr']);
  });

  test('les résultats partiels mettent à jour le texte', () async {
    await controller().start();

    speech.emitPartial("J'ai vendu");
    expect(state().partialText, "J'ai vendu");

    speech.emitPartial("J'ai vendu 2 tas");
    expect(state().partialText, "J'ai vendu 2 tas");
  });

  test('le résultat final termine l\'écoute avec le texte nettoyé', () async {
    await controller().start();

    speech.emitFinal("  J'ai vendu 2 tas de tomates  ");

    expect(state().phase, ListeningPhase.done);
    expect(state().finalText, "J'ai vendu 2 tas de tomates");
  });

  test('un résultat final vide signifie que rien n\'a été entendu', () async {
    await controller().start();

    speech.emitFinal('   ');

    expect(state().phase, ListeningPhase.failed);
    expect(state().failure, SpeechFailure.noSpeech);
    expect(state().finalText, isNull);
  });

  test('permission refusée : échec sans écouter', () async {
    speech.availability = SpeechAvailability.permissionDenied;

    await controller().start();

    expect(state().failure, SpeechFailure.permissionDenied);
    expect(speech.listenedLanguages, isEmpty);
  });

  test('reconnaissance indisponible : échec sans écouter', () async {
    speech.availability = SpeechAvailability.unavailable;

    await controller().start();

    expect(state().failure, SpeechFailure.unavailable);
    expect(speech.listenedLanguages, isEmpty);
  });

  test('erreur pendant l\'écoute', () async {
    await controller().start();

    speech.emitFailure(SpeechFailure.unavailable);

    expect(state().phase, ListeningPhase.failed);
    expect(state().failure, SpeechFailure.unavailable);
  });

  test('toggle démarre puis arrête', () async {
    await controller().toggle();
    expect(state().phase, ListeningPhase.listening);

    speech.emitPartial("J'ai payé 500 F");
    await controller().toggle();

    expect(speech.stopCalls, 1);
    expect(state().finalText, "J'ai payé 500 F");
  });

  test('on peut relancer après un échec', () async {
    await controller().start();
    speech.emitFinal('');

    await controller().toggle();

    expect(state().phase, ListeningPhase.listening);
    expect(state().failure, isNull);
    expect(speech.listenedLanguages, ['fr', 'fr']);
  });

  test('reset annule la session et ignore les événements suivants', () async {
    await controller().start();

    controller().reset();
    speech.emitFinal("J'ai vendu 2 tas");

    expect(speech.cancelCalls, 1);
    expect(state(), const ListeningState());
  });

  test('la destruction du contrôleur annule une écoute en cours', () async {
    await controller().start();

    container.dispose();

    expect(speech.cancelCalls, 1);
  });
}
