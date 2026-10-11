import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/profits/presentation/chart/profit_chart_data.dart';

List<DailyProfit> _days(List<int> nets) => [
  for (final (index, net) in nets.indexed)
    DailyProfit(
      day: DateTime(2026, 10, 12 + index),
      salesFcfa: net > 0 ? net : 0,
      expensesFcfa: net < 0 ? -net : 0,
    ),
];

void main() {
  test('période vide : aucune barre, ligne zéro en bas', () {
    final data = ProfitChartData.fromDaily(const []);

    expect(data.bars, isEmpty);
    expect(data.zeroLine, 1);
    expect(data.isEmpty, isTrue);
    expect(data.best, isNull);
    expect(data.totalFcfa, 0);
  });

  test('jours tous à zéro : barres plates', () {
    final data = ProfitChartData.fromDaily(_days([0, 0, 0]));

    expect(data.bars.map((b) => b.ratio), [0, 0, 0]);
    expect(data.zeroLine, 1);
    expect(data.isEmpty, isTrue);
  });

  test(
    'uniquement des gains : la plus haute barre occupe toute la hauteur',
    () {
      final data = ProfitChartData.fromDaily(_days([2000, 10000, 5000]));

      expect(data.zeroLine, 1);
      expect(data.bars.map((b) => b.ratio), [0.2, 1.0, 0.5]);
      expect(data.best?.netFcfa, 10000);
      expect(data.totalFcfa, 17000);
    },
  );

  test('uniquement des pertes : ligne zéro en haut, barres vers le bas', () {
    final data = ProfitChartData.fromDaily(_days([-1000, -4000]));

    expect(data.zeroLine, 0);
    expect(data.bars.map((b) => b.ratio), [-0.25, -1.0]);
  });

  test('gains et pertes : l\'échelle couvre du minimum au maximum', () {
    final data = ProfitChartData.fromDaily(_days([3000, -1000, 0]));

    expect(data.zeroLine, 0.75);
    expect(data.bars.map((b) => b.ratio), [0.75, -0.25, 0]);
    expect(data.best?.day, DateTime(2026, 10, 12));
  });
}
