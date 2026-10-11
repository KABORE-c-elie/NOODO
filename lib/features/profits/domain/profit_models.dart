import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

part 'profit_models.freezed.dart';

@freezed
abstract class ProfitSummary with _$ProfitSummary {
  const ProfitSummary._();

  const factory ProfitSummary({
    required DateRange range,
    required int salesFcfa,
    required int expensesFcfa,
  }) = _ProfitSummary;

  int get netFcfa => salesFcfa - expensesFcfa;
}

@freezed
abstract class ProfitComparison with _$ProfitComparison {
  const ProfitComparison._();

  const factory ProfitComparison({
    required ProfitSummary current,
    required ProfitSummary previous,
  }) = _ProfitComparison;

  int get differenceFcfa => current.netFcfa - previous.netFcfa;

  double? get differencePercent => previous.netFcfa == 0
      ? null
      : differenceFcfa / previous.netFcfa.abs() * 100;
}

@freezed
abstract class CategoryProfit with _$CategoryProfit {
  const CategoryProfit._();

  const factory CategoryProfit({
    required TransactionCategory category,
    required int salesFcfa,
    required int expensesFcfa,
  }) = _CategoryProfit;

  int get netFcfa => salesFcfa - expensesFcfa;
}

@freezed
abstract class DailyProfit with _$DailyProfit {
  const DailyProfit._();

  const factory DailyProfit({
    required DateTime day,
    required int salesFcfa,
    required int expensesFcfa,
  }) = _DailyProfit;

  int get netFcfa => salesFcfa - expensesFcfa;
}
