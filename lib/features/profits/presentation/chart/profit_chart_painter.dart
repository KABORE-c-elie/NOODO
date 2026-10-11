import 'package:flutter/rendering.dart';
import 'package:noodo/features/profits/presentation/chart/profit_chart_data.dart';

const _barWidthRatio = 0.7;

class ProfitChartPainter extends CustomPainter {
  const ProfitChartPainter({
    required this.data,
    required this.positiveColor,
    required this.negativeColor,
    required this.axisColor,
  });

  final ProfitChartData data;
  final Color positiveColor;
  final Color negativeColor;
  final Color axisColor;

  @override
  void paint(Canvas canvas, Size size) {
    final baseline = size.height * data.zeroLine;
    canvas.drawLine(
      Offset(0, baseline),
      Offset(size.width, baseline),
      Paint()
        ..color = axisColor
        ..strokeWidth = 1,
    );
    if (data.bars.isEmpty) return;

    final slot = size.width / data.bars.length;
    final barWidth = slot * _barWidthRatio;
    final positive = Paint()..color = positiveColor;
    final negative = Paint()..color = negativeColor;
    for (final (index, bar) in data.bars.indexed) {
      if (bar.ratio == 0) continue;
      final left = slot * index + (slot - barWidth) / 2;
      final top = baseline - bar.ratio * size.height;
      canvas.drawRect(
        Rect.fromLTRB(left, top, left + barWidth, baseline),
        bar.ratio > 0 ? positive : negative,
      );
    }
  }

  @override
  bool shouldRepaint(ProfitChartPainter oldDelegate) =>
      oldDelegate.data != data ||
      oldDelegate.positiveColor != positiveColor ||
      oldDelegate.negativeColor != negativeColor ||
      oldDelegate.axisColor != axisColor;
}
