import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/utils/date_range.dart';

void main() {
  final wednesday = DateTime(2026, 10, 14, 15, 30);

  test('jour : de minuit à minuit', () {
    final range = DateRange.of(PeriodUnit.day, wednesday);

    expect(range.start, DateTime(2026, 10, 14));
    expect(range.end, DateTime(2026, 10, 15));
    expect(range.previous(PeriodUnit.day).start, DateTime(2026, 10, 13));
  });

  test('semaine : du lundi au lundi suivant', () {
    final range = DateRange.of(PeriodUnit.week, wednesday);

    expect(range.start, DateTime(2026, 10, 12));
    expect(range.end, DateTime(2026, 10, 19));
    expect(range.previous(PeriodUnit.week).start, DateTime(2026, 10, 5));
  });

  test('mois : précédent à cheval sur l\'année', () {
    final range = DateRange.of(PeriodUnit.month, DateTime(2026, 1, 31));

    expect(range.start, DateTime(2026));
    expect(range.end, DateTime(2026, 2));
    expect(
      range.previous(PeriodUnit.month),
      DateRange(start: DateTime(2025, 12), end: DateTime(2026)),
    );
  });

  test('contains : début inclus, fin exclue', () {
    final range = DateRange.of(PeriodUnit.day, wednesday);

    expect(range.contains(DateTime(2026, 10, 14)), isTrue);
    expect(range.contains(DateTime(2026, 10, 15)), isFalse);
  });
}
