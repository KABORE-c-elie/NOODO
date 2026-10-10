import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/presentation/period_format.dart';
import 'package:noodo/features/profits/presentation/providers/profit_report_provider.dart';
import 'package:noodo/features/profits/presentation/providers/profits_period_provider.dart';

class PeriodSummary extends ConsumerWidget {
  const PeriodSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final period = ref.watch(profitsPeriodControllerProvider);
    final figures = ref.watch(
      profitReportProvider.select(
        (report) => report.whenData(
          (r) => (
            r.comparison.current.netFcfa,
            r.comparison.differenceFcfa,
            r.comparison.differencePercent,
          ),
        ),
      ),
    );
    final (net, difference, percent) = switch (figures) {
      AsyncData(:final value) => value,
      _ => (null, null, null),
    };
    if (net == null || difference == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: LinearProgressIndicator(),
        ),
      );
    }

    final locale = Localizations.localeOf(context).toLanguageTag();
    final label = formatPeriod(l10n, locale, period.unit, period.range);
    final amount = net.abs();
    final isGain = net >= 0;
    final sentence = switch ((period.isCurrent, period.unit)) {
      (true, PeriodUnit.day) =>
        isGain ? l10n.todayEarned(amount) : l10n.todayLost(amount),
      (true, PeriodUnit.week) =>
        isGain ? l10n.weekEarned(amount) : l10n.weekLost(amount),
      (true, PeriodUnit.month) =>
        isGain ? l10n.monthEarned(amount) : l10n.monthLost(amount),
      (false, _) =>
        isGain ? l10n.pastEarned(label, amount) : l10n.pastLost(label, amount),
    };
    final rounded = percent?.abs().round();
    final (comparison, color) = switch (difference) {
      > 0 => (
        rounded == null
            ? l10n.previousMore(difference)
            : l10n.previousMorePercent(difference, rounded),
        theme.colorScheme.primary,
      ),
      < 0 => (
        rounded == null
            ? l10n.previousLess(-difference)
            : l10n.previousLessPercent(-difference, rounded),
        theme.colorScheme.error,
      ),
      _ => (l10n.previousSame, theme.colorScheme.onSurfaceVariant),
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sentence, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              comparison,
              style: theme.textTheme.bodyLarge?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
