import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

final class ProfitCalculator {
  const ProfitCalculator();

  ProfitSummary summarize(Iterable<Transaction> transactions, DateRange range) {
    var sales = 0;
    var expenses = 0;
    for (final transaction in _within(transactions, range)) {
      switch (transaction.type) {
        case TransactionType.sale:
          sales += transaction.amountFcfa;
        case TransactionType.expense:
          expenses += transaction.amountFcfa;
      }
    }
    return ProfitSummary(
      range: range,
      salesFcfa: sales,
      expensesFcfa: expenses,
    );
  }

  ProfitComparison compare(
    Iterable<Transaction> transactions,
    PeriodUnit unit,
    DateTime reference,
  ) {
    final current = DateRange.of(unit, reference);
    return ProfitComparison(
      current: summarize(transactions, current),
      previous: summarize(transactions, current.previous(unit)),
    );
  }

  List<CategoryProfit> byCategory(
    Iterable<Transaction> transactions,
    DateRange range,
  ) {
    final sales = <TransactionCategory, int>{};
    final expenses = <TransactionCategory, int>{};
    for (final transaction in _within(transactions, range)) {
      final totals = switch (transaction.type) {
        TransactionType.sale => sales,
        TransactionType.expense => expenses,
      };
      totals.update(
        transaction.category,
        (total) => total + transaction.amountFcfa,
        ifAbsent: () => transaction.amountFcfa,
      );
    }

    final categories = {...sales.keys, ...expenses.keys};
    return [
      for (final category in categories)
        CategoryProfit(
          category: category,
          salesFcfa: sales[category] ?? 0,
          expensesFcfa: expenses[category] ?? 0,
        ),
    ]..sort(
      (a, b) => a.netFcfa != b.netFcfa
          ? b.netFcfa.compareTo(a.netFcfa)
          : a.category.index.compareTo(b.category.index),
    );
  }

  Iterable<Transaction> _within(
    Iterable<Transaction> transactions,
    DateRange range,
  ) => transactions.where((transaction) => range.contains(transaction.date));
}
