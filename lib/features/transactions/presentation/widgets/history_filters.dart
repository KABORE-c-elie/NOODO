import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/history/history_filter.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

class HistoryFilters extends StatelessWidget {
  const HistoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TypeFilter(),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _PeriodFilter()),
              SizedBox(width: 12),
              Expanded(child: _CategoryFilter()),
            ],
          ),
        ],
      ),
    );
  }
}

enum _TypeChoice {
  all(null),
  sales(TransactionType.sale),
  expenses(TransactionType.expense);

  const _TypeChoice(this.type);

  final TransactionType? type;

  static _TypeChoice of(TransactionType? type) =>
      values.firstWhere((choice) => choice.type == type);

  String label(AppLocalizations l10n) => switch (this) {
    _TypeChoice.all => l10n.typeAll,
    _TypeChoice.sales => l10n.filterSales,
    _TypeChoice.expenses => l10n.filterExpenses,
  };
}

class _TypeFilter extends ConsumerWidget {
  const _TypeFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final type = ref.watch(
      historyFilterControllerProvider.select((filter) => filter.type),
    );
    return SegmentedButton<_TypeChoice>(
      showSelectedIcon: false,
      selected: {_TypeChoice.of(type)},
      onSelectionChanged: (selection) => ref
          .read(historyFilterControllerProvider.notifier)
          .setType(selection.first.type),
      segments: [
        for (final choice in _TypeChoice.values)
          ButtonSegment(
            value: choice,
            label: Text(choice.label(l10n)),
            tooltip: choice.label(l10n),
          ),
      ],
    );
  }
}

class _PeriodFilter extends ConsumerWidget {
  const _PeriodFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final period = ref.watch(
      historyFilterControllerProvider.select((filter) => filter.period),
    );
    return DropdownButtonFormField<HistoryPeriod>(
      initialValue: period,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: l10n.periodLabel,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      onChanged: (value) {
        if (value == null) return;
        ref.read(historyFilterControllerProvider.notifier).setPeriod(value);
      },
      items: [
        for (final value in HistoryPeriod.values)
          DropdownMenuItem(
            value: value,
            child: Text(switch (value) {
              HistoryPeriod.all => l10n.periodAll,
              HistoryPeriod.day => l10n.periodDay,
              HistoryPeriod.week => l10n.periodWeek,
              HistoryPeriod.month => l10n.periodMonth,
            }),
          ),
      ],
    );
  }
}

class _CategoryFilter extends ConsumerWidget {
  const _CategoryFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final category = ref.watch(
      historyFilterControllerProvider.select((filter) => filter.category),
    );
    return DropdownButtonFormField<TransactionCategory?>(
      initialValue: category,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: l10n.categoryLabel,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      onChanged: ref.read(historyFilterControllerProvider.notifier).setCategory,
      items: [
        DropdownMenuItem(value: null, child: Text(l10n.categoryAll)),
        for (final value in TransactionCategory.values)
          DropdownMenuItem(value: value, child: Text(value.label(l10n))),
      ],
    );
  }
}
