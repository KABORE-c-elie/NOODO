import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/transactions/domain/speech/speech_service.dart';
import 'package:noodo/features/transactions/presentation/voice/listening_controller.dart';
import 'package:noodo/features/transactions/presentation/widgets/listening_pulse.dart';

const _buttonSize = 112.0;
const _pulseSize = 168.0;

class VoiceRecorder extends ConsumerWidget {
  const VoiceRecorder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(listeningControllerProvider.select((state) => state.finalText), (
      _,
      finalText,
    ) {
      if (finalText == null) return;
      ref.read(listeningControllerProvider.notifier).reset();
      context.push(AppRoutes.confirmationPath(finalText));
    });

    return const Column(
      children: [
        _MicButton(),
        SizedBox(height: AppSpacing.md),
        _ListeningFeedback(),
        _ManualEntryButton(),
      ],
    );
  }
}

class _MicButton extends ConsumerWidget {
  const _MicButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isActive = ref.watch(
      listeningControllerProvider.select((state) => state.isActive),
    );
    final label = isActive ? l10n.stopListening : l10n.recordTransaction;
    return SizedBox.square(
      dimension: _pulseSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            const RepaintBoundary(child: ListeningPulse(size: _pulseSize)),
          Tooltip(
            message: label,
            child: Semantics(
              button: true,
              label: label,
              excludeSemantics: true,
              child: SizedBox.square(
                dimension: _buttonSize,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () =>
                      ref.read(listeningControllerProvider.notifier).toggle(),
                  child: Icon(isActive ? Icons.stop : Icons.mic, size: 56),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListeningFeedback extends ConsumerWidget {
  const _ListeningFeedback();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final (isActive, partialText, failure) = ref.watch(
      listeningControllerProvider.select(
        (state) => (state.isActive, state.partialText, state.failure),
      ),
    );

    if (isActive) {
      return Semantics(
        liveRegion: true,
        child: Text(
          partialText.isEmpty ? l10n.listening : partialText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }
    if (failure == null) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;
    return Semantics(
      liveRegion: true,
      child: Material(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(switch (failure) {
            SpeechFailure.permissionDenied => l10n.speechPermissionDenied,
            SpeechFailure.unavailable => l10n.speechUnavailable,
            SpeechFailure.noSpeech => l10n.speechNoSpeech,
          }, style: TextStyle(color: colors.onErrorContainer)),
        ),
      ),
    );
  }
}

class _ManualEntryButton extends ConsumerWidget {
  const _ManualEntryButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Tooltip(
      message: l10n.manualEntryTooltip,
      child: TextButton.icon(
        icon: const Icon(Icons.keyboard_outlined),
        label: Text(l10n.manualEntry),
        onPressed: () {
          ref.read(listeningControllerProvider.notifier).reset();
          context.push(AppRoutes.confirmationPath());
        },
      ),
    );
  }
}
