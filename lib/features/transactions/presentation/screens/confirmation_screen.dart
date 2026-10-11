import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/features/transactions/presentation/confirmation/confirmation_controller.dart';
import 'package:noodo/features/transactions/presentation/widgets/confirmation_fields.dart';

class ConfirmationScreen extends ConsumerStatefulWidget {
  const ConfirmationScreen({
    super.key,
    this.initialTranscript,
    this.transactionId,
  });

  final String? initialTranscript;
  final String? transactionId;

  @override
  ConsumerState<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends ConsumerState<ConfirmationScreen> {
  late final TextEditingController _transcript;

  @override
  void initState() {
    super.initState();
    _transcript = TextEditingController(text: widget.initialTranscript);
    final transactionId = widget.transactionId;
    if (transactionId != null) {
      Future.microtask(() => _loadForEdit(transactionId));
    } else if (_transcript.text.trim().isNotEmpty) {
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

  Future<void> _loadForEdit(String transactionId) async {
    final notifier = ref.read(confirmationControllerProvider.notifier);
    if (!await notifier.loadForEdit(transactionId) || !mounted) return;
    _transcript.text = ref.read(confirmationControllerProvider).rawText;
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final outcome = await ref
        .read(confirmationControllerProvider.notifier)
        .save();
    if (outcome == null || !mounted) return;
    final message = switch (outcome) {
      SaveOutcome(isUpdate: true) => l10n.transactionUpdated,
      SaveOutcome(count: 1, taxSavedFcfa: final tax) when tax > 0 =>
        l10n.transactionSavedWithTax(tax),
      SaveOutcome(count: 1) => l10n.transactionSaved,
      SaveOutcome(:final count, taxSavedFcfa: final tax) when tax > 0 =>
        l10n.transactionsSavedWithTax(count, tax),
      SaveOutcome(:final count) => l10n.transactionsSaved(count),
    };
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
    final isEditing = ref.watch(
      confirmationControllerProvider.select((draft) => draft.isEditing),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? l10n.editTransactionTitle : l10n.confirmationTitle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
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
            ),
          ),
          const SizedBox(height: AppSpacing.md),
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
            const SizedBox(height: AppSpacing.lg),
            const TransactionCards(),
            const SizedBox(height: AppSpacing.sm),
            SaveButton(onSave: _save),
          ],
        ],
      ),
    );
  }
}
