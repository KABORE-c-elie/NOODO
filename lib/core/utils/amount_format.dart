import 'package:intl/intl.dart';

const minusSign = '−';

String formatAmount(int value, String locale) {
  final digits = NumberFormat.decimalPattern(locale).format(value.abs());
  return value < 0 ? '$minusSign$digits' : digits;
}
