import 'package:noodo/features/transactions/data/speech_to_text_service.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'speech_providers.g.dart';

@Riverpod(keepAlive: true)
SpeechService speechService(Ref ref) {
  final service = SpeechToTextService();
  ref.onDispose(service.dispose);
  return service;
}
