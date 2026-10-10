import 'package:noodo/features/transactions/domain/transaction.dart';

sealed class HistoryEntry {
  const HistoryEntry();
}

final class HistoryDayHeader extends HistoryEntry {
  const HistoryDayHeader(this.day);

  final DateTime day;
}

final class HistoryTransaction extends HistoryEntry {
  const HistoryTransaction(this.transaction);

  final Transaction transaction;
}

List<HistoryEntry> groupByDay(List<Transaction> transactions) {
  final entries = <HistoryEntry>[];
  DateTime? currentDay;
  for (final transaction in transactions) {
    final date = transaction.date;
    final day = DateTime(date.year, date.month, date.day);
    if (day != currentDay) {
      entries.add(HistoryDayHeader(day));
      currentDay = day;
    }
    entries.add(HistoryTransaction(transaction));
  }
  return entries;
}
