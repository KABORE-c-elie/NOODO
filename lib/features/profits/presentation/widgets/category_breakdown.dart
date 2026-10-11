import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/utils/amount_format.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/theme/app_colors.dart';
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
    final appColors = AppColors.of(context);
    final color = appColors.forNet(net, theme.colorScheme.onSurfaceVariant);
    final fraction = maxMagnitude == 0 ? 0.0 : net.abs() / maxMagnitude;
    return Semantics(
      container: true,
      excludeSemantics: true,
      label: net < 0
          ? l10n.lossSemantics(name, -net)
          : l10n.profitSemantics(name, net),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(name)),
                Text(
                  l10n.signedAmountFcfa(
                    formatAmount(
                      net,
                      Localizations.localeOf(context).toLanguageTag(),
                    ),
                  ),
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w800,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
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
