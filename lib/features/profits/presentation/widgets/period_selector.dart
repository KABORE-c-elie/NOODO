import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/presentation/period_format.dart';
import 'package:noodo/features/profits/presentation/providers/profits_period_provider.dart';

class PeriodSelector extends ConsumerWidget {
  const PeriodSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final period = ref.watch(profitsPeriodControllerProvider);
    final controller = ref.read(profitsPeriodControllerProvider.notifier);
    final label = formatPeriod(l10n, locale, period.unit, period.range);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButton<PeriodUnit>(
          showSelectedIcon: false,
          selected: {period.unit},
          onSelectionChanged: (selection) =>
              controller.selectUnit(selection.first),
          segments: [
            for (final (unit, text) in [
              (PeriodUnit.day, l10n.periodDay),
              (PeriodUnit.week, l10n.periodWeek),
              (PeriodUnit.month, l10n.periodMonth),
            ])
              ButtonSegment(value: unit, label: Text(text), tooltip: text),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              tooltip: l10n.periodPrevious,
              onPressed: controller.previous,
            ),
            Expanded(
              child: Semantics(
                liveRegion: true,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              tooltip: l10n.periodNext,
              onPressed: period.isCurrent ? null : controller.next,
            ),
          ],
        ),
      ],
    );
  }
}
