import 'dart:async';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_query.dart';
import 'package:noodo/features/transactions/presentation/history/history_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_controller.freezed.dart';
part 'history_controller.g.dart';

const historyPageSize = 30;

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState({
    required List<Transaction> items,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _HistoryState;
}

@riverpod
class HistoryController extends _$HistoryController {
  late TransactionQuery _query;
  int _generation = 0;

  @override
  Future<HistoryState> build() {
    final filter = ref.watch(historyFilterControllerProvider);
    final today = ref.watch(currentDayProvider);
    _query = filter.toQuery(today);
    final changes = ref
        .watch(transactionRepositoryProvider)
        .watchChanges()
        .listen((_) => unawaited(_refresh()));
    ref.onDispose(changes.cancel);
    return _fetch(limit: historyPageSize);
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    final generation = _generation;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final page = await _fetch(
      limit: historyPageSize,
      after: TransactionCursor.after(current.items.last),
    );
    if (!ref.mounted || generation != _generation) return;
    state = AsyncData(
      HistoryState(
        items: [...current.items, ...page.items],
        hasMore: page.hasMore,
      ),
    );
  }

  Future<void> delete(Transaction transaction) async {
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(
          items: [
            for (final item in current.items)
              if (item.id != transaction.id) item,
          ],
        ),
      );
    }
    await ref.read(transactionRepositoryProvider).delete(transaction.id);
  }

  Future<void> restore(Transaction transaction) =>
      ref.read(transactionRepositoryProvider).add(transaction);

  Future<void> _refresh() async {
    final generation = ++_generation;
    final loaded = state.value?.items.length ?? 0;
    final page = await _fetch(limit: max(historyPageSize, loaded));
    if (!ref.mounted || generation != _generation) return;
    state = AsyncData(page);
  }

  Future<HistoryState> _fetch({
    required int limit,
    TransactionCursor? after,
  }) async {
    final rows = await ref
        .read(transactionRepositoryProvider)
        .listPage(query: _query, after: after, limit: limit + 1);
    return HistoryState(
      items: rows.take(limit).toList(),
      hasMore: rows.length > limit,
    );
  }
}
