import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(16),
        children: [
          const PeriodSelector(),
          const SizedBox(height: 16),
          const PeriodSummary(),
          const SizedBox(height: 24),
          Text(l10n.dailyChartTitle, style: titleStyle),
          const SizedBox(height: 8),
          const DailyProfitChart(),
          const SizedBox(height: 24),
          Text(l10n.categoriesTitle, style: titleStyle),
          const SizedBox(height: 8),
          const CategoryBreakdown(),
        ],
      ),
    );
  }
}
