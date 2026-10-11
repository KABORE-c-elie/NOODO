import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/profits/presentation/providers/profits_period_provider.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profit_report_provider.freezed.dart';
part 'profit_report_provider.g.dart';

@freezed
abstract class ProfitReport with _$ProfitReport {
  const factory ProfitReport({
    required ProfitComparison comparison,
    required List<CategoryProfit> categories,
    required List<DailyProfit> daily,
  }) = _ProfitReport;
}

@riverpod
Stream<ProfitReport> profitReport(Ref ref) {
  final (unit, reference) = ref.watch(
    profitsPeriodControllerProvider.select(
      (period) => (period.unit, period.reference),
    ),
  );
  final current = DateRange.of(unit, reference);
  final previous = current.previous(unit);
  const calculator = ProfitCalculator();
  return ref
      .watch(transactionRepositoryProvider)
      .watchInRange(DateRange(start: previous.start, end: current.end))
      .map(
        (transactions) => ProfitReport(
          comparison: calculator.compare(transactions, unit, reference),
          categories: calculator.byCategory(transactions, current),
          daily: calculator.daily(transactions, current),
        ),
      );
}
