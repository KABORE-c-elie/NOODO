import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profits_period_provider.freezed.dart';
part 'profits_period_provider.g.dart';

@freezed
abstract class ProfitsPeriod with _$ProfitsPeriod {
  const ProfitsPeriod._();

  const factory ProfitsPeriod({
    required PeriodUnit unit,
    required DateTime reference,
    required DateTime today,
  }) = _ProfitsPeriod;

  DateRange get range => DateRange.of(unit, reference);

  bool get isCurrent => range.contains(today);
}

@riverpod
class ProfitsPeriodController extends _$ProfitsPeriodController {
  @override
  ProfitsPeriod build() {
    final today = ref.watch(currentDayProvider);
    return ProfitsPeriod(unit: PeriodUnit.week, reference: today, today: today);
  }

  void selectUnit(PeriodUnit unit) =>
      state = state.copyWith(unit: unit, reference: state.today);

  void previous() =>
      state = state.copyWith(reference: state.range.previous(state.unit).start);

  void next() {
    if (state.isCurrent) return;
    state = state.copyWith(reference: state.range.end);
  }
}
