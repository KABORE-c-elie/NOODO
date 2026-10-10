import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/confirmation/confirmation_controller.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

const _fieldSpacing = SizedBox(height: 16);

class LowConfidenceBanner extends ConsumerWidget {
  const LowConfidenceBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needsReview = ref.watch(
      confirmationControllerProvider.select((draft) => draft.needsReview),
    );
    if (!needsReview) return const SizedBox.shrink();
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(Icons.warning_amber, color: colors.onErrorContainer),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  AppLocalizations.of(context).lowConfidenceWarning,
                  style: TextStyle(color: colors.onErrorContainer),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DraftFields extends ConsumerWidget {
  const DraftFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revision = ref.watch(
      confirmationControllerProvider.select((draft) => draft.revision),
    );
    return KeyedSubtree(
      key: ValueKey(revision),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TypeField(),
          _fieldSpacing,
          _AmountField(),
          _fieldSpacing,
          _QuantityField(),
          _fieldSpacing,
          _UnitField(),
          _UnknownUnitPrompt(),
          _fieldSpacing,
          _ProductField(),
          _fieldSpacing,
          _CategoryField(),
        ],
      ),
    );
  }
}

class _TypeField extends ConsumerWidget {
  const _TypeField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final type = ref.watch(
      confirmationControllerProvider.select((draft) => draft.type),
    );
    final needsCheck = ref.watch(
      confirmationControllerProvider.select((draft) => draft.typeNeedsCheck),
    );
    return InputDecorator(
      decoration: InputDecoration(
        labelText: l10n.typeLabel,
        errorText: needsCheck ? l10n.fieldToCheck : null,
        border: const OutlineInputBorder(),
      ),
      child: SegmentedButton<TransactionType>(
        emptySelectionAllowed: true,
        selected: {?type},
        onSelectionChanged: (selection) {
          if (selection.isEmpty) return;
          ref
              .read(confirmationControllerProvider.notifier)
              .setType(selection.first);
        },
        segments: [
          for (final value in TransactionType.values)
            ButtonSegment(
              value: value,
              label: Text(value.label(l10n)),
              tooltip: value.label(l10n),
            ),
        ],
      ),
    );
  }
}

class _AmountField extends ConsumerWidget {
  const _AmountField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final amount = ref.watch(
      confirmationControllerProvider.select((draft) => draft.amountFcfa),
    );
    final needsCheck = ref.watch(
      confirmationControllerProvider.select((draft) => draft.amountNeedsCheck),
    );
    return TextFormField(
      initialValue: amount?.toString() ?? '',
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: ref.read(confirmationControllerProvider.notifier).setAmount,
      decoration: InputDecoration(
        labelText: l10n.amountLabel,
        errorText: needsCheck ? l10n.fieldToCheck : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _QuantityField extends ConsumerWidget {
  const _QuantityField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(
      confirmationControllerProvider.select((draft) => draft.quantity),
    );
    return TextFormField(
      initialValue: switch (quantity) {
        null => '',
        final value when value == value.truncateToDouble() =>
          value.toInt().toString(),
        final value => value.toString(),
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: ref.read(confirmationControllerProvider.notifier).setQuantity,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).quantityLabel,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _UnitField extends ConsumerWidget {
  const _UnitField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final unit = ref.watch(
      confirmationControllerProvider.select((draft) => draft.unit),
    );
    final known = ref.watch(unitsProvider).value ?? const <LocalUnit>[];
    final options = {...known, ?unit}.toList();
    return DropdownButtonFormField<LocalUnit?>(
      initialValue: unit,
      onChanged: ref.read(confirmationControllerProvider.notifier).setUnit,
      decoration: InputDecoration(
        labelText: l10n.unitLabel,
        border: const OutlineInputBorder(),
      ),
      items: [
        DropdownMenuItem(value: null, child: Text(l10n.noUnit)),
        for (final option in options)
          DropdownMenuItem(value: option, child: Text(option.name)),
      ],
    );
  }
}

class _UnknownUnitPrompt extends ConsumerWidget {
  const _UnknownUnitPrompt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final unknown = ref.watch(
      confirmationControllerProvider.select((draft) => draft.unknownUnitText),
    );
    if (unknown == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(child: Text(l10n.unknownUnit(unknown))),
          Tooltip(
            message: l10n.addUnitTooltip(unknown),
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: Text(l10n.addThisUnit),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final unit = await ref
                    .read(confirmationControllerProvider.notifier)
                    .addUnknownUnit();
                if (unit == null) return;
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.unitAdded(unit.name))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductField extends ConsumerWidget {
  const _ProductField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(
      confirmationControllerProvider.select((draft) => draft.product),
    );
    return TextFormField(
      initialValue: product ?? '',
      textCapitalization: TextCapitalization.sentences,
      onChanged: ref.read(confirmationControllerProvider.notifier).setProduct,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).productLabel,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _CategoryField extends ConsumerWidget {
  const _CategoryField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final category = ref.watch(
      confirmationControllerProvider.select((draft) => draft.category),
    );
    return DropdownButtonFormField<TransactionCategory>(
      initialValue: category,
      onChanged: (value) {
        if (value == null) return;
        ref.read(confirmationControllerProvider.notifier).setCategory(value);
      },
      decoration: InputDecoration(
        labelText: l10n.categoryLabel,
        border: const OutlineInputBorder(),
      ),
      items: [
        for (final value in TransactionCategory.values)
          DropdownMenuItem(value: value, child: Text(value.label(l10n))),
      ],
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key, required this.onSave});

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final canSave = ref.watch(
      confirmationControllerProvider.select((draft) => draft.canSave),
    );
    return Tooltip(
      message: l10n.saveTooltip,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
        onPressed: canSave ? onSave : null,
        icon: const Icon(Icons.check),
        label: Text(l10n.save),
      ),
    );
  }
}
