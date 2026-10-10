// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'NOODO';

  @override
  String get homeTitle => 'Home';

  @override
  String get confirmationTitle => 'Confirmation';

  @override
  String get historyTitle => 'History';

  @override
  String get profitsTitle => 'My profits';

  @override
  String get nodesTitle => 'My nodes';

  @override
  String get creditorTitle => 'Creditor details';

  @override
  String get receiptsTitle => 'Receipts';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get transactionTypeSale => 'Sale';

  @override
  String get transactionTypeExpense => 'Expense';

  @override
  String amountFcfa(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString FCFA';
  }
}
