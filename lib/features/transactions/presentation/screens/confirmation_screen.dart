import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/transactions/presentation/confirmation/confirmation_controller.dart';
import 'package:noodo/features/transactions/presentation/widgets/confirmation_fields.dart';

class ConfirmationScreen extends ConsumerStatefulWidget {
  const ConfirmationScreen({super.key, this.initialTranscript});

  final String? initialTranscript;

  @override
  ConsumerState<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends ConsumerState<ConfirmationScreen> {
  late final TextEditingController _transcript;

  @override
  void initState() {
    super.initState();
    _transcript = TextEditingController(text: widget.initialTranscript);
    if (_transcript.text.trim().isNotEmpty) {
      Future.microtask(_analyze);
    }
  }

  @override
  void dispose() {
    _transcript.dispose();
    super.dispose();
  }

  Future<void> _analyze() => ref
      .read(confirmationControllerProvider.notifier)
      .analyze(_transcript.text);

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final message = AppLocalizations.of(context).transactionSaved;
    final saved = await ref
        .read(confirmationControllerProvider.notifier)
        .save();
    if (!saved || !mounted) return;
    messenger.showSnackBar(SnackBar(content: Text(message)));
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAnalyzed = ref.watch(
      confirmationControllerProvider.select((draft) => draft.isAnalyzed),
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.confirmationTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _transcript,
            minLines: 1,
            maxLines: 3,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _analyze(),
            decoration: InputDecoration(
              labelText: l10n.transcriptLabel,
              hintText: l10n.transcriptHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Tooltip(
              message: l10n.analyzeTooltip,
              child: FilledButton.tonalIcon(
                onPressed: _analyze,
                icon: const Icon(Icons.auto_fix_high),
                label: Text(l10n.analyze),
              ),
            ),
          ),
          if (isAnalyzed) ...[
            const SizedBox(height: 16),
            const LowConfidenceBanner(),
            const DraftFields(),
            const SizedBox(height: 24),
            SaveButton(onSave: _save),
          ],
        ],
      ),
    );
  }
}
