import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/profits/presentation/providers/profit_report_provider.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

const _barHeight = 12.0;

class CategoryBreakdown extends ConsumerWidget {
  const CategoryBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final categories = ref.watch(
      profitReportProvider.select(
        (report) => report.whenData((r) => r.categories),
      ),
    );
    return switch (categories) {
      AsyncData(:final value) when value.isEmpty => Text(l10n.noDataForPeriod),
      AsyncData(:final value) => Column(
        children: [
          for (final category in value)
            _CategoryRow(
              category: category,
              maxMagnitude: value
                  .map((c) => c.netFcfa.abs())
                  .reduce((a, b) => a > b ? a : b),
            ),
        ],
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({required this.category, required this.maxMagnitude});

  final CategoryProfit category;
  final int maxMagnitude;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final net = category.netFcfa;
    final name = category.category.label(l10n);
    final color = net < 0 ? theme.colorScheme.error : theme.colorScheme.primary;
    final fraction = maxMagnitude == 0 ? 0.0 : net.abs() / maxMagnitude;
    return Semantics(
      container: true,
      excludeSemantics: true,
      label: net < 0
          ? l10n.lossSemantics(name, -net)
          : l10n.profitSemantics(name, net),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(name)),
                Text(
                  l10n.amountFcfa(net),
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(_barHeight / 2),
              child: Container(
                height: _barHeight,
                color: theme.colorScheme.surfaceContainerHighest,
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: fraction,
                  heightFactor: 1,
                  child: ColoredBox(color: color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
