import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/profits/presentation/providers/today_comparison_provider.dart';

class TodaySummaryCard extends StatelessWidget {
  const TodaySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_TodayNet(), SizedBox(height: 8), _ComparedToYesterday()],
        ),
      ),
    );
  }
}

class _TodayNet extends ConsumerWidget {
  const _TodayNet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final net = ref.watch(
      todayComparisonProvider.select(
        (comparison) => comparison.whenData((c) => c.current.netFcfa),
      ),
    );
    return net.when(
      data: (value) => Text(
        value >= 0 ? l10n.todayEarned(value) : l10n.todayLost(-value),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      loading: () => const LinearProgressIndicator(),
      error: (_, _) => Text(l10n.summaryError),
    );
  }
}

class _ComparedToYesterday extends ConsumerWidget {
  const _ComparedToYesterday();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final difference = ref
        .watch(
          todayComparisonProvider.select(
            (comparison) => comparison.whenData((c) => c.differenceFcfa),
          ),
        )
        .value;
    if (difference == null) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;
    final (text, color) = switch (difference) {
      > 0 => (l10n.comparedMore(difference), colors.primary),
      < 0 => (l10n.comparedLess(-difference), colors.error),
      _ => (l10n.comparedSame, colors.onSurfaceVariant),
    };
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
    );
  }
}
