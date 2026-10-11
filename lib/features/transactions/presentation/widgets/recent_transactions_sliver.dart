import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/presentation/providers/recent_transactions_provider.dart';
import 'package:noodo/features/transactions/presentation/widgets/transaction_tile.dart';

class RecentTransactionsSliver extends ConsumerWidget {
  const RecentTransactionsSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final transactions = ref.watch(recentTransactionsProvider);
    return transactions.when(
      data: (items) => items.isEmpty
          ? SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Text(l10n.noTransactions, textAlign: TextAlign.center),
              ),
            )
          : SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  TransactionTile(transaction: items[index]),
            ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) =>
          SliverToBoxAdapter(child: Center(child: Text(l10n.summaryError))),
    );
  }
}
