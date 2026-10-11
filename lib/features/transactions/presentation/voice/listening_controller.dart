import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/transactions/data/speech_providers.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listening_controller.freezed.dart';
part 'listening_controller.g.dart';

enum ListeningPhase { idle, starting, listening, done, failed }

@freezed
abstract class ListeningState with _$ListeningState {
  const ListeningState._();

  const factory ListeningState({
    @Default(ListeningPhase.idle) ListeningPhase phase,
    @Default('') String partialText,
    String? finalText,
    SpeechFailure? failure,
  }) = _ListeningState;

  bool get isActive =>
      phase == ListeningPhase.starting || phase == ListeningPhase.listening;
}

@riverpod
class ListeningController extends _$ListeningController {
  SpeechService? _service;
  StreamSubscription<SpeechEvent>? _subscription;
  bool _sessionOpen = false;

  @override
  ListeningState build() {
    ref.onDispose(() {
      unawaited(_subscription?.cancel());
      if (_sessionOpen) unawaited(_service?.cancel());
    });
    return const ListeningState();
  }

  Future<void> toggle() async {
    switch (state.phase) {
      case ListeningPhase.listening:
        await stop();
      case ListeningPhase.starting:
        return;
      case ListeningPhase.idle || ListeningPhase.done || ListeningPhase.failed:
        await start();
    }
  }

  Future<void> start() async {
    if (state.isActive) return;
    state = const ListeningState(phase: ListeningPhase.starting);
    final service = ref.read(speechServiceProvider);
    _service = service;
    final availability = await service.initialize();
    if (!ref.mounted) return;
    switch (availability) {
      case SpeechAvailability.permissionDenied:
        return _fail(SpeechFailure.permissionDenied);
      case SpeechAvailability.unavailable:
        return _fail(SpeechFailure.unavailable);
      case SpeechAvailability.available:
        break;
    }

    unawaited(_subscription?.cancel());
    _subscription = service.events.listen(_onEvent);
    state = state.copyWith(phase: ListeningPhase.listening);
    _sessionOpen = true;
    await service.listen(
      languageCode: ref.read(appLocaleProvider).languageCode,
    );
  }

  Future<void> stop() async {
    if (state.phase != ListeningPhase.listening) return;
    await _service?.stop();
  }

  void reset() {
    if (_sessionOpen) unawaited(_service?.cancel());
    _sessionOpen = false;
    unawaited(_subscription?.cancel());
    _subscription = null;
    state = const ListeningState();
  }

  void _onEvent(SpeechEvent event) {
    if (!ref.mounted || state.phase != ListeningPhase.listening) return;
    switch (event) {
      case SpeechPartial(:final text):
        state = state.copyWith(partialText: text);
      case SpeechFinal(:final text) when text.trim().isEmpty:
        _fail(SpeechFailure.noSpeech);
      case SpeechFinal(:final text):
        _sessionOpen = false;
        state = state.copyWith(
          phase: ListeningPhase.done,
          partialText: text.trim(),
          finalText: text.trim(),
        );
      case SpeechFailed(:final failure):
        _fail(failure);
    }
  }

  void _fail(SpeechFailure failure) {
    _sessionOpen = false;
    state = ListeningState(phase: ListeningPhase.failed, failure: failure);
  }
}
