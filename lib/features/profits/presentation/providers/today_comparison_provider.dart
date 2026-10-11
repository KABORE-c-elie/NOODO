import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_comparison_provider.g.dart';

@riverpod
Stream<ProfitComparison> todayComparison(Ref ref) {
  final today = ref.watch(currentDayProvider);
  final todayRange = DateRange.of(PeriodUnit.day, today);
  final range = DateRange(
    start: todayRange.previous(PeriodUnit.day).start,
    end: todayRange.end,
  );
  const calculator = ProfitCalculator();
  return ref
      .watch(transactionRepositoryProvider)
      .watchInRange(range)
      .map(
        (transactions) =>
            calculator.compare(transactions, PeriodUnit.day, today),
      );
}
