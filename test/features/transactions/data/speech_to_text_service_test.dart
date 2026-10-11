import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:noodo/features/transactions/data/speech_to_text_service.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class _MockSpeechToText extends Mock implements SpeechToText {}

SpeechRecognitionResult _result(String words, {required bool isFinal}) =>
    SpeechRecognitionResult([
      SpeechRecognitionWords(words, null, 0.9),
    ], (isFinal ? ResultType.finalResult : ResultType.partial).value);

void main() {
  late _MockSpeechToText speech;
  late SpeechToTextService service;
  late List<SpeechEvent> events;
  SpeechErrorListener? onError;
  SpeechStatusListener? onStatus;
  SpeechResultListener? onResult;

  setUpAll(() => registerFallbackValue(SpeechListenOptions()));

  setUp(() {
    speech = _MockSpeechToText();
    service = SpeechToTextService(speech);
    events = [];
    service.events.listen(events.add);
    when(
      () => speech.initialize(
        onError: any(named: 'onError'),
        onStatus: any(named: 'onStatus'),
      ),
    ).thenAnswer((invocation) async {
      onError = invocation.namedArguments[#onError] as SpeechErrorListener?;
      onStatus = invocation.namedArguments[#onStatus] as SpeechStatusListener?;
      return true;
    });
    when(() => speech.locales()).thenAnswer(
      (_) async => [
        LocaleName('en_US', 'English'),
        LocaleName('fr_FR', 'Français'),
      ],
    );
    when(
      () => speech.listen(
        onResult: any(named: 'onResult'),
        listenOptions: any(named: 'listenOptions'),
      ),
    ).thenAnswer((invocation) async {
      onResult = invocation.namedArguments[#onResult] as SpeechResultListener?;
    });
    when(() => speech.stop()).thenAnswer((_) async {});
    when(() => speech.cancel()).thenAnswer((_) async {});
  });

  Future<void> startListening() async {
    await service.initialize();
    await service.listen(languageCode: 'fr');
    await pumpEventQueue();
  }

  group('initialisation', () {
    test('disponible', () async {
      expect(await service.initialize(), SpeechAvailability.available);
    });

    test('échec sans permission', () async {
      when(
        () => speech.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).thenAnswer((_) async => false);
      when(() => speech.hasPermission).thenAnswer((_) async => false);

      expect(await service.initialize(), SpeechAvailability.permissionDenied);
    });

    test('échec avec permission : service indisponible', () async {
      when(
        () => speech.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).thenAnswer((_) async => false);
      when(() => speech.hasPermission).thenAnswer((_) async => true);

      expect(await service.initialize(), SpeechAvailability.unavailable);
    });

    test('exception de la plateforme : indisponible', () async {
      when(
        () => speech.initialize(
          onError: any(named: 'onError'),
          onStatus: any(named: 'onStatus'),
        ),
      ).thenThrow(PlatformException(code: 'recognizerNotAvailable'));

      expect(await service.initialize(), SpeechAvailability.unavailable);
    });
  });

  group('choix de la langue', () {
    SpeechListenOptions capturedOptions() =>
        verify(
              () => speech.listen(
                onResult: any(named: 'onResult'),
                listenOptions: captureAny(named: 'listenOptions'),
              ),
            ).captured.single
            as SpeechListenOptions;

    test('fr_FR quand il est disponible, avec résultats partiels', () async {
      await startListening();

      final options = capturedOptions();
      expect(options.localeId, 'fr_FR');
      expect(options.partialResults, isTrue);
    });

    test('autre variante de français sinon', () async {
      when(() => speech.locales())
          .thenAnswer((_) async => [LocaleName('fr-CA', 'Français (Canada)')]);

      await startListening();

      expect(capturedOptions().localeId, 'fr_CA');
    });
  });

  group('événements', () {
    test('partiel puis final', () async {
      await startListening();

      onResult!(_result("J'ai vendu", isFinal: false));
      onResult!(_result("J'ai vendu 2 tas", isFinal: true));
      onStatus!(SpeechToText.doneStatus);
      await pumpEventQueue();

      expect(events, const [
        SpeechEvent.partial("J'ai vendu"),
        SpeechEvent.finalResult("J'ai vendu 2 tas"),
      ]);
    });

    test('fin d\'écoute sans résultat final : dernier texte partiel', () async {
      await startListening();

      onResult!(_result("J'ai payé", isFinal: false));
      onStatus!(SpeechToText.doneStatus);
      await pumpEventQueue();

      expect(events.last, const SpeechEvent.finalResult("J'ai payé"));
    });

    final errors = {
      'error_permission': SpeechFailure.permissionDenied,
      'error_no_match': SpeechFailure.noSpeech,
      'error_speech_timeout': SpeechFailure.noSpeech,
      'error_network': SpeechFailure.unavailable,
      'error_language_unavailable': SpeechFailure.unavailable,
      'error_busy': SpeechFailure.unavailable,
    };
    for (final MapEntry(key: code, value: failure) in errors.entries) {
      test('$code devient ${failure.name}', () async {
        await startListening();

        onError!(SpeechRecognitionError(code, true));
        onStatus!(SpeechToText.doneStatus);
        await pumpEventQueue();

        expect(events, [SpeechEvent.failure(failure)]);
      });
    }

    test('rien n\'est émis après une annulation', () async {
      await startListening();

      await service.cancel();
      onResult!(_result('trop tard', isFinal: true));
      await pumpEventQueue();

      expect(events, isEmpty);
    });
  });
}
