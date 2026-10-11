import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/nodes/presentation/creditor_actions.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';

Future<void> showAddCreditorSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const _AddCreditorSheet(),
    );

class _AddCreditorSheet extends ConsumerStatefulWidget {
  const _AddCreditorSheet();

  @override
  ConsumerState<_AddCreditorSheet> createState() => _AddCreditorSheetState();
}

class _AddCreditorSheetState extends ConsumerState<_AddCreditorSheet> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _dueDate;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _amount.dispose();
    super.dispose();
  }

  Future<void> _pickDueDate() async {
    final today = ref.read(currentDayProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? today,
      firstDate: DateTime(today.year - 1),
      lastDate: DateTime(today.year + 5),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final scheduler = ref.read(reminderSchedulerProvider);
    final dueDate = _dueDate;
    await ref
        .read(creditorActionsProvider)
        .addCreditor(
          supplierName: _name.text,
          phone: _phone.text,
          balanceDueFcfa: int.parse(_amount.text),
          dueDate: dueDate,
        );
    navigator.pop();
    messenger.showSnackBar(SnackBar(content: Text(l10n.creditorAdded)));
    if (dueDate != null) {
      await requestReminderPermission(
        scheduler: scheduler,
        messenger: messenger,
        deniedMessage: l10n.notificationsDenied,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final dueDate = _dueDate;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.addCreditor,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(labelText: l10n.creditorNameLabel),
                validator: (value) => value == null || value.trim().isEmpty
                    ? l10n.requiredField
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: l10n.creditorPhoneLabel),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _amount,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: l10n.amountDueLabel),
                validator: (value) => (int.tryParse(value ?? '') ?? 0) > 0
                    ? null
                    : l10n.invalidAmount,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: Tooltip(
                      message: l10n.chooseDueDate,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.event),
                        label: Text(
                          dueDate == null
                              ? l10n.dueDateLabel
                              : l10n.dueOn(
                                  DateFormat.yMMMd(locale).format(dueDate),
                                ),
                        ),
                        onPressed: _pickDueDate,
                      ),
                    ),
                  ),
                  if (dueDate != null)
                    IconButton(
                      tooltip: l10n.clearDueDate,
                      icon: const Icon(Icons.clear),
                      onPressed: () => setState(() => _dueDate = null),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Tooltip(
                message: l10n.addCreditorTooltip,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _submit,
                  child: Text(l10n.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
