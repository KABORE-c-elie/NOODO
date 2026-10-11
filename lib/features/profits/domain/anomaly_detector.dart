import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';
import 'package:noodo/features/profits/domain/profit_calculator.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

const expenseLookbackDays = 30;
const profitLookbackDays = 7;
const minCategoryExpenses = 3;
const minActiveDays = 3;

final class AnomalyDetector {
  const AnomalyDetector({this.calculator = const ProfitCalculator()});

  final ProfitCalculator calculator;

  static double expenseRatio(AlertSensitivity sensitivity) =>
      switch (sensitivity) {
        AlertSensitivity.low => 3,
        AlertSensitivity.normal => 2,
        AlertSensitivity.high => 1.5,
      };

  static double profitRatio(AlertSensitivity sensitivity) =>
      switch (sensitivity) {
        AlertSensitivity.low => 0.25,
        AlertSensitivity.normal => 0.5,
        AlertSensitivity.high => 0.75,
      };

  List<Anomaly> detect({
    required List<Transaction> transactions,
    required DateTime today,
    required AlertSensitivity sensitivity,
  }) {
    final day = DateTime(today.year, today.month, today.day);
    return [
      ?_unusualExpense(transactions, day, sensitivity),
      ?_lowProfitDay(transactions, _addDays(day, -1), sensitivity),
    ];
  }

  Anomaly? _unusualExpense(
    List<Transaction> transactions,
    DateTime day,
    AlertSensitivity sensitivity,
  ) {
    final todayRange = DateRange.of(PeriodUnit.day, day);
    final history = DateRange(
      start: _addDays(day, -expenseLookbackDays),
      end: day,
    );
    Anomaly? strongest;
    var strongestRatio = 0.0;
    for (final expense in transactions) {
      if (expense.type != TransactionType.expense ||
          !todayRange.contains(expense.date)) {
        continue;
      }
      final previous = [
        for (final t in transactions)
          if (t.type == TransactionType.expense &&
              t.category == expense.category &&
              history.contains(t.date))
            t.amountFcfa,
      ];
      if (previous.length < minCategoryExpenses) continue;
      final average = previous.reduce((a, b) => a + b) / previous.length;
      final ratio = expense.amountFcfa / average;
      if (ratio > expenseRatio(sensitivity) && ratio > strongestRatio) {
        strongestRatio = ratio;
        strongest = Anomaly(
          type: AnomalyType.unusualExpense,
          day: day,
          amountFcfa: expense.amountFcfa,
          averageFcfa: average.round(),
          category: expense.category,
          label: expense.product ?? expense.rawText,
        );
      }
    }
    return strongest;
  }

  Anomaly? _lowProfitDay(
    List<Transaction> transactions,
    DateTime day,
    AlertSensitivity sensitivity,
  ) {
    final evaluated = calculator.summarize(
      transactions,
      DateRange.of(PeriodUnit.day, day),
    );
    if (evaluated.salesFcfa == 0 && evaluated.expensesFcfa == 0) return null;
    final activeDays = calculator
        .daily(
          transactions,
          DateRange(start: _addDays(day, -profitLookbackDays), end: day),
        )
        .where((d) => d.salesFcfa > 0 || d.expensesFcfa > 0)
        .toList();
    if (activeDays.length < minActiveDays) return null;
    final average =
        activeDays.fold(0, (sum, d) => sum + d.netFcfa) / activeDays.length;
    if (average <= 0) return null;
    if (evaluated.netFcfa >= average * profitRatio(sensitivity)) return null;
    return Anomaly(
      type: AnomalyType.lowProfitDay,
      day: day,
      amountFcfa: evaluated.netFcfa,
      averageFcfa: average.round(),
    );
  }

  DateTime _addDays(DateTime day, int days) =>
      DateTime(day.year, day.month, day.day + days);
}
