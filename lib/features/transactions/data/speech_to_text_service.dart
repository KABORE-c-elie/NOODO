import 'dart:async';

import 'package:flutter/services.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

const _defaultRegions = {'fr': 'FR', 'en': 'US'};

const _noSpeechErrors = {'error_no_match', 'error_speech_timeout'};

const _permissionErrors = {'error_permission'};

final class SpeechToTextService implements SpeechService {
  SpeechToTextService([SpeechToText? speech])
    : _speech = speech ?? SpeechToText();

  static const listenFor = Duration(seconds: 30);
  static const pauseFor = Duration(seconds: 3);

  final SpeechToText _speech;
  final _events = StreamController<SpeechEvent>.broadcast();
  String _lastWords = '';
  bool _sessionActive = false;

  @override
  bool get isAvailable => _speech.isAvailable;

  @override
  Stream<SpeechEvent> get events => _events.stream;

  @override
  Future<SpeechAvailability> initialize() async {
    try {
      final initialized = await _speech.initialize(
        onError: _onError,
        onStatus: _onStatus,
      );
      if (initialized) return SpeechAvailability.available;
      return await _speech.hasPermission
          ? SpeechAvailability.unavailable
          : SpeechAvailability.permissionDenied;
    } on PlatformException {
      return SpeechAvailability.unavailable;
    }
  }

  @override
  Future<void> listen({required String languageCode}) async {
    _lastWords = '';
    _sessionActive = true;
    try {
      await _speech.listen(
        onResult: _onResult,
        listenOptions: SpeechListenOptions(
          localeId: await _resolveLocaleId(languageCode),
          partialResults: true,
          cancelOnError: true,
          listenMode: ListenMode.dictation,
          listenFor: listenFor,
          pauseFor: pauseFor,
        ),
      );
    } on PlatformException {
      _complete(const SpeechEvent.failure(SpeechFailure.unavailable));
    }
  }

  @override
  Future<void> stop() => _speech.stop();

  @override
  Future<void> cancel() async {
    _sessionActive = false;
    await _speech.cancel();
  }

  Future<void> dispose() async {
    await cancel();
    await _events.close();
  }

  Future<String> _resolveLocaleId(String languageCode) async {
    final preferred =
        '${languageCode}_${_defaultRegions[languageCode] ?? languageCode.toUpperCase()}';
    final available = (await _speech.locales())
        .map((locale) => locale.localeId.replaceAll('-', '_'))
        .toList();
    if (available.contains(preferred)) return preferred;
    return available.firstWhere(
      (id) => id.startsWith('${languageCode}_'),
      orElse: () => preferred,
    );
  }

  void _onResult(SpeechRecognitionResult result) {
    if (!_sessionActive) return;
    _lastWords = result.recognizedWords;
    if (result.finalResult) {
      _complete(SpeechEvent.finalResult(_lastWords));
    } else {
      _events.add(SpeechEvent.partial(_lastWords));
    }
  }

  void _onError(SpeechRecognitionError error) {
    final failure = switch (error.errorMsg) {
      final message when _permissionErrors.contains(message) =>
        SpeechFailure.permissionDenied,
      final message when _noSpeechErrors.contains(message) =>
        SpeechFailure.noSpeech,
      _ => SpeechFailure.unavailable,
    };
    _complete(SpeechEvent.failure(failure));
  }

  void _onStatus(String status) {
    if (status == SpeechToText.doneStatus) {
      _complete(SpeechEvent.finalResult(_lastWords));
    }
  }

  void _complete(SpeechEvent event) {
    if (!_sessionActive) return;
    _sessionActive = false;
    _events.add(event);
  }
}
