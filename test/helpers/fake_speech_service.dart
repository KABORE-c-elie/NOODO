import 'dart:async';

import 'package:noodo/features/transactions/domain/speech/speech_service.dart';

class FakeSpeechService implements SpeechService {
  FakeSpeechService({this.availability = SpeechAvailability.available});

  SpeechAvailability availability;
  final listenedLanguages = <String>[];
  int initializeCalls = 0;
  int stopCalls = 0;
  int cancelCalls = 0;
  bool isListening = false;

  final _events = StreamController<SpeechEvent>.broadcast(sync: true);
  String _lastPartial = '';

  @override
  bool get isAvailable => availability == SpeechAvailability.available;

  @override
  Stream<SpeechEvent> get events => _events.stream;

  @override
  Future<SpeechAvailability> initialize() async {
    initializeCalls++;
    return availability;
  }

  @override
  Future<void> listen({required String languageCode}) async {
    listenedLanguages.add(languageCode);
    isListening = true;
    _lastPartial = '';
  }

  @override
  Future<void> stop() async {
    stopCalls++;
    if (isListening) emitFinal(_lastPartial);
  }

  @override
  Future<void> cancel() async {
    cancelCalls++;
    isListening = false;
  }

  void emitPartial(String text) {
    _lastPartial = text;
    _events.add(SpeechEvent.partial(text));
  }

  void emitFinal(String text) {
    isListening = false;
    _events.add(SpeechEvent.finalResult(text));
  }

  void emitFailure(SpeechFailure failure) {
    isListening = false;
    _events.add(SpeechEvent.failure(failure));
  }
}
