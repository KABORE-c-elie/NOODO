import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'day_net_provider.g.dart';

@riverpod
Stream<int> dayNet(Ref ref, DateTime day) {
  const calculator = ProfitCalculator();
  final range = DateRange.of(PeriodUnit.day, day);
  return ref
      .watch(transactionRepositoryProvider)
      .watchDay(day)
      .map((transactions) => calculator.summarize(transactions, range).netFcfa);
}
