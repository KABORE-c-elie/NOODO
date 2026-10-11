import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/widgets/edge_fade.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/history/history_filter.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

const _chipSpacing = SizedBox(width: AppSpacing.sm);

class HistoryFilters extends ConsumerWidget {
  const HistoryFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final filter = ref.watch(historyFilterControllerProvider);
    final controller = ref.read(historyFilterControllerProvider.notifier);
    final category = filter.category;
    return SizedBox(
      height: 56,
      child: EdgeFade(
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          children: [
            Tooltip(
              message: l10n.filtersTooltip,
              child: ActionChip(
                avatar: const Icon(Icons.tune, size: 18),
                label: Text(l10n.filters),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  showDragHandle: true,
                  builder: (_) => const _CategorySheet(),
                ),
              ),
            ),
            if (category != null) ...[
              _chipSpacing,
              InputChip(
                label: Text(category.label(l10n)),
                selected: true,
                onDeleted: () => controller.setCategory(null),
                deleteButtonTooltipMessage: l10n.clearCategoryFilter,
              ),
            ],
            _chipSpacing,
            const VerticalDivider(width: 8),
            for (final period in HistoryPeriod.values) ...[
              _chipSpacing,
              ChoiceChip(
                label: Text(_periodLabel(l10n, period)),
                tooltip: _periodLabel(l10n, period),
                selected: filter.period == period,
                onSelected: (_) => controller.setPeriod(period),
              ),
            ],
            _chipSpacing,
            const VerticalDivider(width: 8),
            for (final (type, label) in [
              (TransactionType.sale, l10n.filterSales),
              (TransactionType.expense, l10n.filterExpenses),
            ]) ...[
              _chipSpacing,
              FilterChip(
                label: Text(label),
                tooltip: label,
                selected: filter.type == type,
                onSelected: (selected) =>
                    controller.setType(selected ? type : null),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _periodLabel(AppLocalizations l10n, HistoryPeriod period) =>
      switch (period) {
        HistoryPeriod.all => l10n.periodAll,
        HistoryPeriod.day => l10n.periodDay,
        HistoryPeriod.week => l10n.periodWeek,
        HistoryPeriod.month => l10n.periodMonth,
      };
}

class _CategorySheet extends ConsumerWidget {
  const _CategorySheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected = ref.watch(
      historyFilterControllerProvider.select((filter) => filter.category),
    );
    void choose(TransactionCategory? category) {
      ref.read(historyFilterControllerProvider.notifier).setCategory(category);
      Navigator.of(context).pop();
    }

    return SafeArea(
      child: RadioGroup<TransactionCategory?>(
        groupValue: selected,
        onChanged: choose,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Text(
                l10n.categoryLabel,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            RadioListTile<TransactionCategory?>(
              value: null,
              title: Text(l10n.categoryAll),
            ),
            for (final category in TransactionCategory.values)
              RadioListTile<TransactionCategory?>(
                value: category,
                title: Text(category.label(l10n)),
              ),
          ],
        ),
      ),
    );
  }
}
