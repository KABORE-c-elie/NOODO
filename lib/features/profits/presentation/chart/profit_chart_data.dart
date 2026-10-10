import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';

part 'profit_chart_data.freezed.dart';

@freezed
abstract class ChartBar with _$ChartBar {
  const factory ChartBar({
    required DateTime day,
    required int netFcfa,
    required double ratio,
  }) = _ChartBar;
}

@freezed
abstract class ProfitChartData with _$ProfitChartData {
  const ProfitChartData._();

  const factory ProfitChartData({
    required List<ChartBar> bars,
    required double zeroLine,
  }) = _ProfitChartData;

  factory ProfitChartData.fromDaily(List<DailyProfit> days) {
    final highest = days.fold(
      0,
      (max, day) => day.netFcfa > max ? day.netFcfa : max,
    );
    final lowest = days.fold(
      0,
      (min, day) => day.netFcfa < min ? day.netFcfa : min,
    );
    final span = highest - lowest;
    return ProfitChartData(
      zeroLine: span == 0 ? 1 : highest / span,
      bars: [
        for (final day in days)
          ChartBar(
            day: day.day,
            netFcfa: day.netFcfa,
            ratio: span == 0 ? 0 : day.netFcfa / span,
          ),
      ],
    );
  }

  bool get isEmpty => bars.every((bar) => bar.netFcfa == 0);

  ChartBar? get best => bars.isEmpty
      ? null
      : bars.reduce((a, b) => b.netFcfa > a.netFcfa ? b : a);

  int get totalFcfa => bars.fold(0, (sum, bar) => sum + bar.netFcfa);
}
