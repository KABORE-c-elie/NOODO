import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/theme/app_colors.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';

class TaxNodeCard extends ConsumerWidget {
  const TaxNodeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final taxNode = ref.watch(taxNodeProvider).value;
    if (taxNode == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: LinearProgressIndicator(),
        ),
      );
    }
    final dueDate = taxNode.nextDueDate;
    final rate = NumberFormat.decimalPattern(locale)
        .format(taxNode.ratePercent);
    return Card(
      color: AppColors.of(context).savingsContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.savings_outlined,
                  color: AppColors.of(context).onSavingsContainer,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(l10n.taxNodeTitle, style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.taxSaved(taxNode.savedBalanceFcfa),
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(l10n.taxRate(rate)),
            Text(
              dueDate == null
                  ? l10n.taxNoDue
                  : l10n.taxNextDue(DateFormat.yMMMMd(locale).format(dueDate)),
            ),
          ],
        ),
      ),
    );
  }
}
