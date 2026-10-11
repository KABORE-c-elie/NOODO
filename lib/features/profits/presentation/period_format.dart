import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/date_range.dart';

String formatPeriod(
  AppLocalizations l10n,
  String locale,
  PeriodUnit unit,
  DateRange range,
) => switch (unit) {
  PeriodUnit.day => DateFormat.yMMMMEEEEd(locale).format(range.start),
  PeriodUnit.week => l10n.periodRange(
    DateFormat.MMMMd(locale).format(range.start),
    DateFormat.yMMMMd(locale)
        .format(range.end.subtract(const Duration(days: 1))),
  ),
  PeriodUnit.month => DateFormat.yMMMM(locale).format(range.start),
};

String formatChartDay(String locale, DateTime day) =>
    DateFormat.MMMMEEEEd(locale).format(day);

String chartBarLabel(String locale, PeriodUnit unit, DateTime day) =>
    switch (unit) {
      PeriodUnit.day => DateFormat.MMMd(locale).format(day),
      PeriodUnit.week => DateFormat.E(
        locale,
      ).format(day).substring(0, 1).toUpperCase(),
      PeriodUnit.month => day.day == 1 || day.day % 5 == 0 ? '${day.day}' : '',
    };
