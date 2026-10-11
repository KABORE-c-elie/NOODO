import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/confirmation/confirmation_controller.dart';
import 'package:noodo/features/transactions/presentation/confirmation/transaction_draft.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

const _fieldSpacing = SizedBox(height: AppSpacing.lg);

T? _watchItem<T>(
  WidgetRef ref,
  int id,
  T Function(TransactionDraft item) pick,
) => ref.watch(
  confirmationControllerProvider.select((state) {
    final item = state.item(id);
    return item == null ? null : pick(item);
  }),
);

ConfirmationController _controller(WidgetRef ref) =>
    ref.read(confirmationControllerProvider.notifier);

class TransactionCards extends ConsumerWidget {
  const TransactionCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(
      confirmationControllerProvider.select(
        (state) => [for (final item in state.items) item.id],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, id) in ids.indexed)
          TransactionCard(
            key: ValueKey(id),
            id: id,
            index: index,
            count: ids.length,
          ),
      ],
    );
  }
}

class TransactionCard extends ConsumerWidget {
  const TransactionCard({
    super.key,
    required this.id,
    required this.index,
    required this.count,
  });

  final int id;
  final int index;
  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final revision = ref.watch(
      confirmationControllerProvider.select((state) => state.revision),
    );
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (count > 1)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.transactionNumber(index + 1, count),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.removeTransaction,
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _controller(ref).remove(id),
                  ),
                ],
              ),
            _LowConfidenceBanner(id: id),
            KeyedSubtree(
              key: ValueKey((revision, id)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _TypeField(id: id),
                  _fieldSpacing,
                  _AmountField(id: id),
                  _PriceBasisSelector(id: id),
                  _fieldSpacing,
                  _QuantityField(id: id),
                  _fieldSpacing,
                  _UnitField(id: id),
                  _UnknownUnitPrompt(id: id),
                  _fieldSpacing,
                  _ProductField(id: id),
                  _fieldSpacing,
                  _CategoryField(id: id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LowConfidenceBanner extends ConsumerWidget {
  const _LowConfidenceBanner({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needsReview = _watchItem(ref, id, (item) => item.needsReview);
    if (needsReview != true) return const SizedBox.shrink();
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Material(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Icon(Icons.warning_amber, color: colors.onErrorContainer),
              const SizedBox(width: AppSpacing.md),
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

class _TypeField extends ConsumerWidget {
  const _TypeField({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final type = _watchItem(ref, id, (item) => item.type);
    final needsCheck = _watchItem(ref, id, (item) => item.typeNeedsCheck);
    return InputDecorator(
      decoration: InputDecoration(
        labelText: l10n.typeLabel,
        errorText: needsCheck == true ? l10n.fieldToCheck : null,
      ),
      child: SegmentedButton<TransactionType>(
        emptySelectionAllowed: true,
        selected: {?type},
        onSelectionChanged: (selection) {
          if (selection.isEmpty) return;
          _controller(ref).setType(id, selection.first);
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

class _AmountField extends ConsumerStatefulWidget {
  const _AmountField({required this.id});

  final int id;

  @override
  ConsumerState<_AmountField> createState() => _AmountFieldState();
}

class _AmountFieldState extends ConsumerState<_AmountField> {
  late final TextEditingController _text = TextEditingController(
    text:
        ref
            .read(confirmationControllerProvider)
            .item(widget.id)
            ?.amountFcfa
            ?.toString() ??
        '',
  );

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ref.listen(
      confirmationControllerProvider.select(
        (state) => state.item(widget.id)?.amountFcfa,
      ),
      (_, amount) {
        if (int.tryParse(_text.text) != amount) {
          _text.text = amount?.toString() ?? '';
        }
      },
    );
    final needsCheck = _watchItem(
      ref,
      widget.id,
      (item) => item.amountNeedsCheck,
    );
    return TextFormField(
      controller: _text,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) => _controller(ref).setAmount(widget.id, value),
      style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()]),
      decoration: InputDecoration(
        labelText: l10n.amountLabel,
        errorText: needsCheck == true ? l10n.fieldToCheck : null,
      ),
    );
  }
}

class _PriceBasisSelector extends ConsumerWidget {
  const _PriceBasisSelector({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final data = _watchItem(
      ref,
      id,
      (item) => item.canChoosePriceBasis
          ? (
              item.priceBasis,
              item.quantity!,
              item.statedPriceFcfa!,
              item.amountFcfa,
            )
          : null,
    );
    if (data == null) return const SizedBox.shrink();
    final (basis, quantity, unitPrice, total) = data;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<PriceBasis>(
            showSelectedIcon: false,
            selected: {basis},
            onSelectionChanged: (selection) =>
                _controller(ref).setPriceBasis(id, selection.first),
            segments: [
              for (final (value, label) in [
                (PriceBasis.total, l10n.priceBasisTotal),
                (PriceBasis.perUnit, l10n.priceBasisUnit),
              ])
                ButtonSegment(value: value, label: Text(label), tooltip: label),
            ],
          ),
          if (basis == PriceBasis.perUnit && total != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(
                l10n.priceCalculation(
                  NumberFormat.decimalPattern(locale).format(quantity),
                  unitPrice,
                  total,
                ),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuantityField extends ConsumerWidget {
  const _QuantityField({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = _watchItem(ref, id, (item) => item.quantity);
    return TextFormField(
      initialValue: switch (quantity) {
        null => '',
        final value when value == value.truncateToDouble() =>
          value.toInt().toString(),
        final value => value.toString(),
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) => _controller(ref).setQuantity(id, value),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).quantityLabel,
      ),
    );
  }
}

class _UnitField extends ConsumerWidget {
  const _UnitField({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final unit = _watchItem(ref, id, (item) => item.unit);
    final known = ref.watch(unitsProvider).value ?? const <LocalUnit>[];
    final options = {...known, ?unit}.toList();
    return DropdownButtonFormField<LocalUnit?>(
      initialValue: unit,
      onChanged: (value) => _controller(ref).setUnit(id, value),
      decoration: InputDecoration(labelText: l10n.unitLabel),
      items: [
        DropdownMenuItem(value: null, child: Text(l10n.noUnit)),
        for (final option in options)
          DropdownMenuItem(value: option, child: Text(option.name)),
      ],
    );
  }
}

class _UnknownUnitPrompt extends ConsumerWidget {
  const _UnknownUnitPrompt({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final unknown = _watchItem(ref, id, (item) => item.unknownUnitText);
    if (unknown == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.sm,
        children: [
          Text(l10n.unknownUnit(unknown)),
          Tooltip(
            message: l10n.addUnitTooltip(unknown),
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: Text(l10n.addThisUnit),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final unit = await _controller(ref).addUnknownUnit(id);
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
  const _ProductField({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = _watchItem(ref, id, (item) => item.product);
    return TextFormField(
      initialValue: product ?? '',
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => _controller(ref).setProduct(id, value),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).productLabel,
      ),
    );
  }
}

class _CategoryField extends ConsumerWidget {
  const _CategoryField({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final category =
        _watchItem(ref, id, (item) => item.category) ??
        TransactionCategory.other;
    return DropdownButtonFormField<TransactionCategory>(
      initialValue: category,
      onChanged: (value) {
        if (value == null) return;
        _controller(ref).setCategory(id, value);
      },
      decoration: InputDecoration(labelText: l10n.categoryLabel),
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
    final (canSave, count) = ref.watch(
      confirmationControllerProvider.select(
        (state) => (state.canSave, state.items.length),
      ),
    );
    final label = count > 1 ? l10n.saveAll : l10n.save;
    return Tooltip(
      message: count > 1 ? l10n.saveAllTooltip : l10n.saveTooltip,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
        onPressed: canSave ? onSave : null,
        icon: const Icon(Icons.check),
        label: Text(label),
      ),
    );
  }
}
