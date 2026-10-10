import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_range.freezed.dart';

enum PeriodUnit { day, week, month }

@freezed
abstract class DateRange with _$DateRange {
  const DateRange._();

  const factory DateRange({required DateTime start, required DateTime end}) =
      _DateRange;

  factory DateRange.of(PeriodUnit unit, DateTime reference) {
    final day = DateTime(reference.year, reference.month, reference.day);
    return switch (unit) {
      PeriodUnit.day => DateRange(
        start: day,
        end: DateTime(day.year, day.month, day.day + 1),
      ),
      PeriodUnit.week => DateRange(
        start: DateTime(day.year, day.month, day.day - (day.weekday - 1)),
        end: DateTime(day.year, day.month, day.day - (day.weekday - 1) + 7),
      ),
      PeriodUnit.month => DateRange(
        start: DateTime(day.year, day.month),
        end: DateTime(day.year, day.month + 1),
      ),
    };
  }

  DateRange previous(PeriodUnit unit) =>
      DateRange.of(unit, DateTime(start.year, start.month, start.day - 1));

  bool contains(DateTime moment) =>
      !moment.isBefore(start) && moment.isBefore(end);
}
