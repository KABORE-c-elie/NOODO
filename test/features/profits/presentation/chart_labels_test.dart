import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:noodo/core/utils/amount_format.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/presentation/period_format.dart';

void main() {
  setUpAll(() => initializeDateFormatting('fr'));

  test('semaine : initiale du jour', () {
    final week = [for (var d = 12; d <= 18; d++) DateTime(2026, 10, d)];

    expect(week.map((day) => chartBarLabel('fr', PeriodUnit.week, day)), [
      'L',
      'M',
      'M',
      'J',
      'V',
      'S',
      'D',
    ]);
  });

  test('mois : seulement le 1er et les multiples de 5', () {
    expect(chartBarLabel('fr', PeriodUnit.month, DateTime(2026, 10, 1)), '1');
    expect(chartBarLabel('fr', PeriodUnit.month, DateTime(2026, 10, 3)), '');
    expect(chartBarLabel('fr', PeriodUnit.month, DateTime(2026, 10, 15)), '15');
  });

  test('montants signés avec le vrai signe moins', () {
    expect(formatAmount(-2000, 'fr'), '${minusSign}2 000');
    expect(formatAmount(2000, 'en'), '2,000');
    expect(formatAmount(0, 'fr'), '0');
  });
}
