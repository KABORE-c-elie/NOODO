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

  @override
  String get navHome => 'Home';

  @override
  String get navHistory => 'History';

  @override
  String get navProfits => 'Profits';

  @override
  String get navNodes => 'Nodes';

  @override
  String get openReceipts => 'Open receipts';

  @override
  String get openSettings => 'Open settings';

  @override
  String todayEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Today you earned $amountString FCFA';
  }

  @override
  String todayLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Today you lost $amountString FCFA';
  }

  @override
  String comparedMore(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'That\'s $amountString FCFA more than yesterday';
  }

  @override
  String comparedLess(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'That\'s $amountString FCFA less than yesterday';
  }

  @override
  String get comparedSame => 'Same as yesterday';

  @override
  String get summaryError => 'Unable to compute today\'s summary';

  @override
  String get recentTransactions => 'Latest transactions';

  @override
  String get noTransactions =>
      'No transactions yet. Tap the microphone to start.';

  @override
  String get recordTransaction => 'Dictate a transaction';

  @override
  String saleAmount(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '+$amountString FCFA';
  }

  @override
  String expenseAmount(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '−$amountString FCFA';
  }

  @override
  String get transcriptLabel => 'What you said';

  @override
  String get transcriptHint =>
      'E.g.: J\'ai vendu 2 tas de tomates à 1 000 francs';

  @override
  String get analyze => 'Analyze';

  @override
  String get analyzeTooltip => 'Analyze the sentence';

  @override
  String get typeLabel => 'Type';

  @override
  String get amountLabel => 'Amount (FCFA)';

  @override
  String get quantityLabel => 'Quantity';

  @override
  String get unitLabel => 'Unit';

  @override
  String get noUnit => 'None';

  @override
  String get productLabel => 'Product';

  @override
  String get categoryLabel => 'Category';

  @override
  String get categoryVegetables => 'Vegetables';

  @override
  String get categoryCereals => 'Cereals';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categorySupplies => 'Supplies';

  @override
  String get categoryOther => 'Other';

  @override
  String get lowConfidenceWarning =>
      'I may not have understood correctly. Please check the highlighted fields.';

  @override
  String get fieldToCheck => 'Please check';

  @override
  String unknownUnit(String unit) {
    return 'Unknown unit: \"$unit\"';
  }

  @override
  String get addThisUnit => 'Add this unit';

  @override
  String addUnitTooltip(String unit) {
    return 'Add \"$unit\" to your units';
  }

  @override
  String unitAdded(String unit) {
    return 'Unit \"$unit\" added';
  }

  @override
  String get save => 'Save';

  @override
  String get saveTooltip => 'Save the transaction';

  @override
  String get transactionSaved => 'Transaction saved';
}
