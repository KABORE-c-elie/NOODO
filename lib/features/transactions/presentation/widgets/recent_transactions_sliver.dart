import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/providers/recent_transactions_provider.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

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
                padding: const EdgeInsets.all(24),
                child: Text(l10n.noTransactions, textAlign: TextAlign.center),
              ),
            )
          : SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  _TransactionTile(transaction: items[index]),
            ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) =>
          SliverToBoxAdapter(child: Center(child: Text(l10n.summaryError))),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final isSale = transaction.type == TransactionType.sale;
    final time = DateFormat.Hm(Localizations.localeOf(context).toLanguageTag())
        .format(transaction.date);
    final label = transaction.product ?? transaction.rawText;
    return Semantics(
      container: true,
      excludeSemantics: true,
      label: l10n.transactionSemantics(
        transaction.type.label(l10n),
        label,
        transaction.amountFcfa,
      ),
      child: ListTile(
        leading: Icon(
          isSale ? Icons.south_west : Icons.north_east,
          color: isSale ? colors.primary : colors.error,
        ),
        title: Text(label),
        subtitle: Text(time),
        trailing: Text(
          isSale
              ? l10n.saleAmount(transaction.amountFcfa)
              : l10n.expenseAmount(transaction.amountFcfa),
          style: TextStyle(
            color: isSale ? colors.primary : colors.error,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
