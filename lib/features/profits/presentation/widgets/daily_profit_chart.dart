import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/theme/app_colors.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/profits/presentation/chart/profit_chart_data.dart';
import 'package:noodo/features/profits/presentation/chart/profit_chart_painter.dart';
import 'package:noodo/features/profits/presentation/period_format.dart';
import 'package:noodo/features/profits/presentation/providers/profit_report_provider.dart';
import 'package:noodo/features/profits/presentation/providers/profits_period_provider.dart';

const _chartHeight = 160.0;

class DailyProfitChart extends ConsumerWidget {
  const DailyProfitChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final period = ref.watch(profitsPeriodControllerProvider);
    final data = ref
        .watch(
          profitReportProvider.select(
            (report) =>
                report.whenData((r) => ProfitChartData.fromDaily(r.daily)),
          ),
        )
        .value;
    if (data == null) return const SizedBox(height: _chartHeight);

    final periodLabel = formatPeriod(l10n, locale, period.unit, period.range);
    final best = data.best;
    final summary = data.isEmpty || best == null
        ? l10n.chartSummaryEmpty(periodLabel)
        : l10n.chartSummary(
            periodLabel,
            data.totalFcfa,
            formatChartDay(locale, best.day),
            best.netFcfa,
          );

    final labelStyle = Theme.of(context).textTheme.labelSmall
        ?.copyWith(color: colors.onSurfaceVariant);
    final chart = Semantics(
      container: true,
      explicitChildNodes: true,
      label: summary,
      child: SizedBox(
        height: _chartHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: ProfitChartPainter(
                    data: data,
                    positiveColor: AppColors.of(context).sale,
                    negativeColor: AppColors.of(context).expense,
                    axisColor: colors.outlineVariant,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                for (final bar in data.bars)
                  Expanded(
                    child: Semantics(
                      label: bar.netFcfa < 0
                          ? l10n.lossSemantics(
                              formatChartDay(locale, bar.day),
                              -bar.netFcfa,
                            )
                          : l10n.profitSemantics(
                              formatChartDay(locale, bar.day),
                              bar.netFcfa,
                            ),
                      child: const SizedBox.expand(),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        chart,
        const SizedBox(height: AppSpacing.xs),
        ExcludeSemantics(
          child: Row(
            children: [
              for (final bar in data.bars)
                Expanded(
                  child: Text(
                    chartBarLabel(locale, period.unit, bar.day),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                    style: labelStyle,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
