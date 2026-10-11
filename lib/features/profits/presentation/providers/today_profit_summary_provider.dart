import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_profit_summary_provider.g.dart';

@riverpod
Stream<ProfitSummary> todayProfitSummary(Ref ref) {
  final today = ref.watch(currentDayProvider);
  final range = DateRange.of(PeriodUnit.day, today);
  const calculator = ProfitCalculator();
  return ref
      .watch(transactionRepositoryProvider)
      .watchDay(today)
      .map((transactions) => calculator.summarize(transactions, range));
}
