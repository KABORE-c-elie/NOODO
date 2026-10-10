import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/profits/presentation/providers/day_net_provider.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/presentation/history/history_controller.dart';
import 'package:noodo/features/transactions/presentation/history/history_entries.dart';
import 'package:noodo/features/transactions/presentation/widgets/history_filters.dart';
import 'package:noodo/features/transactions/presentation/widgets/transaction_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).historyTitle)),
      body: const Column(
        children: [
          HistoryFilters(),
          Expanded(child: _HistoryList()),
        ],
      ),
    );
  }
}

class _HistoryList extends ConsumerWidget {
  const _HistoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final history = ref.watch(historyControllerProvider);
    return switch (history) {
      AsyncValue(:final value?) when value.items.isEmpty => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.historyEmpty, textAlign: TextAlign.center),
        ),
      ),
      AsyncValue(:final value?) => _EntriesList(
        entries: groupByDay(value.items),
        hasMore: value.hasMore,
      ),
      AsyncValue(hasError: true) => Center(child: Text(l10n.historyError)),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class _EntriesList extends StatelessWidget {
  const _EntriesList({required this.entries, required this.hasMore});

  final List<HistoryEntry> entries;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == entries.length) return const _LoadMoreTrigger();
        return switch (entries[index]) {
          HistoryDayHeader(:final day) => _DayHeader(
            key: ValueKey(day),
            day: day,
          ),
          HistoryTransaction(:final transaction) => _DismissibleTransaction(
            key: ValueKey(transaction.id),
            transaction: transaction,
          ),
        };
      },
    );
  }
}

class _DayHeader extends ConsumerWidget {
  const _DayHeader({super.key, required this.day});

  final DateTime day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final net = ref.watch(dayNetProvider(day)).value;
    final label = DateFormat.yMMMMEEEEd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(day);
    return Semantics(
      header: true,
      child: Container(
        color: theme.colorScheme.surfaceContainerHighest,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 12,
          runSpacing: 4,
          children: [
            Text(label, style: theme.textTheme.titleSmall),
            if (net != null)
              Text(
                l10n.dayProfit(net),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: net < 0
                      ? theme.colorScheme.error
                      : theme.colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DismissibleTransaction extends ConsumerWidget {
  const _DismissibleTransaction({super.key, required this.transaction});

  final Transaction transaction;

  Future<bool> _confirm(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteConfirmTitle),
        content: Text(
          l10n.deleteConfirmBody(transaction.product ?? transaction.rawText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

  void _deleteWithUndo(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final controller = ref.read(historyControllerProvider.notifier);
    controller.delete(transaction);
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l10n.transactionDeleted),
          persist: false,
          action: SnackBarAction(
            label: l10n.undo,
            onPressed: () => controller.restore(transaction),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Dismissible(
      key: ValueKey('dismiss-${transaction.id}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirm(context),
      onDismissed: (_) => _deleteWithUndo(context, ref),
      background: Container(
        color: colors.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Icon(Icons.delete_outline, color: colors.onErrorContainer),
      ),
      child: TransactionTile(
        transaction: transaction,
        onTap: () =>
            context.push(AppRoutes.editTransactionPath(transaction.id)),
        onDelete: () async {
          if (await _confirm(context) && context.mounted) {
            _deleteWithUndo(context, ref);
          }
        },
      ),
    );
  }
}

class _LoadMoreTrigger extends ConsumerStatefulWidget {
  const _LoadMoreTrigger();

  @override
  ConsumerState<_LoadMoreTrigger> createState() => _LoadMoreTriggerState();
}

class _LoadMoreTriggerState extends ConsumerState<_LoadMoreTrigger> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ref.read(historyControllerProvider.notifier).loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(
          semanticsLabel: AppLocalizations.of(context).loadingMore,
        ),
      ),
    );
  }
}
