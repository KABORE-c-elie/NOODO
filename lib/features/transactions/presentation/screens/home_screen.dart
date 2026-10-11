import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/profits/presentation/widgets/anomaly_cards.dart';
import 'package:noodo/features/profits/presentation/widgets/today_summary_card.dart';
import 'package:noodo/features/transactions/presentation/widgets/recent_transactions_sliver.dart';
import 'package:noodo/features/transactions/presentation/widgets/voice_recorder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_library_outlined),
            tooltip: l10n.openReceipts,
            onPressed: () => context.push(AppRoutes.receipts),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: l10n.openSettings,
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.sm,
            ),
            sliver: SliverList.list(
              children: [
                const TodaySummaryCard(),
                const AnomalyCards(),
                const SizedBox(height: AppSpacing.xl),
                const VoiceRecorder(),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  l10n.recentTransactions,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const RecentTransactionsSliver(),
        ],
      ),
    );
  }
}
