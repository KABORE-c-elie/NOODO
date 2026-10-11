import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_query.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_filter.freezed.dart';
part 'history_filter.g.dart';

enum HistoryPeriod {
  all(null),
  day(PeriodUnit.day),
  week(PeriodUnit.week),
  month(PeriodUnit.month);

  const HistoryPeriod(this.unit);

  final PeriodUnit? unit;
}

@freezed
abstract class HistoryFilter with _$HistoryFilter {
  const HistoryFilter._();

  const factory HistoryFilter({
    @Default(HistoryPeriod.all) HistoryPeriod period,
    TransactionType? type,
    TransactionCategory? category,
  }) = _HistoryFilter;

  TransactionQuery toQuery(DateTime today) {
    final unit = period.unit;
    return TransactionQuery(
      range: unit == null ? null : DateRange.of(unit, today),
      type: type,
      category: category,
    );
  }
}

@riverpod
class HistoryFilterController extends _$HistoryFilterController {
  @override
  HistoryFilter build() => const HistoryFilter();

  void setPeriod(HistoryPeriod period) =>
      state = state.copyWith(period: period);

  void setType(TransactionType? type) => state = state.copyWith(type: type);

  void setCategory(TransactionCategory? category) =>
      state = state.copyWith(category: category);
}
