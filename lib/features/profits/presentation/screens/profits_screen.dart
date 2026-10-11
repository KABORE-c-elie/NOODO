import 'package:flutter/material.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/profits/presentation/widgets/category_breakdown.dart';
import 'package:noodo/features/profits/presentation/widgets/daily_profit_chart.dart';
import 'package:noodo/features/profits/presentation/widgets/period_selector.dart';
import 'package:noodo/features/profits/presentation/widgets/period_summary.dart';

class ProfitsScreen extends StatelessWidget {
  const ProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.profitsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const PeriodSelector(),
          const SizedBox(height: AppSpacing.lg),
          const PeriodSummary(),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.dailyChartTitle, style: titleStyle),
          const SizedBox(height: AppSpacing.sm),
          const DailyProfitChart(),
          const SizedBox(height: AppSpacing.xl),
          Text(l10n.categoriesTitle, style: titleStyle),
          const SizedBox(height: AppSpacing.sm),
          const CategoryBreakdown(),
        ],
      ),
    );
  }
}
