import 'package:freezed_annotation/freezed_annotation.dart';

part 'speech_service.freezed.dart';

enum SpeechAvailability { available, permissionDenied, unavailable }

enum SpeechFailure { permissionDenied, unavailable, noSpeech }

@freezed
sealed class SpeechEvent with _$SpeechEvent {
  const factory SpeechEvent.partial(String text) = SpeechPartial;

  const factory SpeechEvent.finalResult(String text) = SpeechFinal;

  const factory SpeechEvent.failure(SpeechFailure failure) = SpeechFailed;
}

abstract interface class SpeechService {
  bool get isAvailable;

  Stream<SpeechEvent> get events;

  Future<SpeechAvailability> initialize();

  Future<void> listen({required String languageCode});

  Future<void> stop();

  Future<void> cancel();
}
