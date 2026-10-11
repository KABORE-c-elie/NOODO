import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.sale,
    required this.saleContainer,
    required this.onSaleContainer,
    required this.expense,
    required this.expenseContainer,
    required this.onExpenseContainer,
    required this.savings,
    required this.savingsContainer,
    required this.onSavingsContainer,
    required this.alert,
    required this.alertContainer,
    required this.onAlertContainer,
  });

  static const light = AppColors(
    sale: Color(0xFF1B6E3A),
    saleContainer: Color(0xFFD3EEDA),
    onSaleContainer: Color(0xFF0A3218),
    expense: Color(0xFFAE2A1F),
    expenseContainer: Color(0xFFFBE0DB),
    onExpenseContainer: Color(0xFF450B06),
    savings: Color(0xFF7D5300),
    savingsContainer: Color(0xFFF9E4B8),
    onSavingsContainer: Color(0xFF2A1A00),
    alert: Color(0xFF9C4300),
    alertContainer: Color(0xFFFFE2CC),
    onAlertContainer: Color(0xFF3A1600),
  );

  static const dark = AppColors(
    sale: Color(0xFF86D49E),
    saleContainer: Color(0xFF1E4429),
    onSaleContainer: Color(0xFFCDEFD6),
    expense: Color(0xFFFFA294),
    expenseContainer: Color(0xFF5A1D16),
    onExpenseContainer: Color(0xFFFFDBD4),
    savings: Color(0xFFEBC36E),
    savingsContainer: Color(0xFF4F3A08),
    onSavingsContainer: Color(0xFFFCE6B4),
    alert: Color(0xFFFFB98A),
    alertContainer: Color(0xFF5A3013),
    onAlertContainer: Color(0xFFFFE0CB),
  );

  final Color sale;
  final Color saleContainer;
  final Color onSaleContainer;
  final Color expense;
  final Color expenseContainer;
  final Color onExpenseContainer;
  final Color savings;
  final Color savingsContainer;
  final Color onSavingsContainer;
  final Color alert;
  final Color alertContainer;
  final Color onAlertContainer;

  Color forNet(int net, Color neutral) => net > 0
      ? sale
      : net < 0
      ? expense
      : neutral;

  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>() ?? light;

  @override
  AppColors copyWith({
    Color? sale,
    Color? saleContainer,
    Color? onSaleContainer,
    Color? expense,
    Color? expenseContainer,
    Color? onExpenseContainer,
    Color? savings,
    Color? savingsContainer,
    Color? onSavingsContainer,
    Color? alert,
    Color? alertContainer,
    Color? onAlertContainer,
  }) => AppColors(
    sale: sale ?? this.sale,
    saleContainer: saleContainer ?? this.saleContainer,
    onSaleContainer: onSaleContainer ?? this.onSaleContainer,
    expense: expense ?? this.expense,
    expenseContainer: expenseContainer ?? this.expenseContainer,
    onExpenseContainer: onExpenseContainer ?? this.onExpenseContainer,
    savings: savings ?? this.savings,
    savingsContainer: savingsContainer ?? this.savingsContainer,
    onSavingsContainer: onSavingsContainer ?? this.onSavingsContainer,
    alert: alert ?? this.alert,
    alertContainer: alertContainer ?? this.alertContainer,
    onAlertContainer: onAlertContainer ?? this.onAlertContainer,
  );

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      sale: mix(sale, other.sale),
      saleContainer: mix(saleContainer, other.saleContainer),
      onSaleContainer: mix(onSaleContainer, other.onSaleContainer),
      expense: mix(expense, other.expense),
      expenseContainer: mix(expenseContainer, other.expenseContainer),
      onExpenseContainer: mix(onExpenseContainer, other.onExpenseContainer),
      savings: mix(savings, other.savings),
      savingsContainer: mix(savingsContainer, other.savingsContainer),
      onSavingsContainer: mix(onSavingsContainer, other.onSavingsContainer),
      alert: mix(alert, other.alert),
      alertContainer: mix(alertContainer, other.alertContainer),
      onAlertContainer: mix(onAlertContainer, other.onAlertContainer),
    );
  }
}
