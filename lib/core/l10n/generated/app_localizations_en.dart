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

  @override
  String get stopListening => 'Stop listening';

  @override
  String get listening => 'I\'m listening…';

  @override
  String get manualEntry => 'Type it instead';

  @override
  String get manualEntryTooltip => 'Enter the transaction with the keyboard';

  @override
  String get speechPermissionDenied =>
      'I can\'t access the microphone. Allow it in your phone settings, or type your transaction.';

  @override
  String get speechUnavailable =>
      'Speech recognition isn\'t available right now (no network or language not downloaded). You can type your transaction.';

  @override
  String get speechNoSpeech =>
      'I didn\'t hear anything. Tap the microphone to try again, or type your transaction.';

  @override
  String transactionSemantics(String type, String product, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$type: $product, $amountString FCFA';
  }

  @override
  String get periodLabel => 'Period';

  @override
  String get periodAll => 'All';

  @override
  String get periodDay => 'Day';

  @override
  String get periodWeek => 'Week';

  @override
  String get periodMonth => 'Month';

  @override
  String get typeAll => 'All';

  @override
  String get filterSales => 'Sales';

  @override
  String get filterExpenses => 'Expenses';

  @override
  String get categoryAll => 'All';

  @override
  String get historyEmpty => 'No transactions match these filters.';

  @override
  String dayProfit(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Profit: $amountString FCFA';
  }

  @override
  String get deleteConfirmTitle => 'Delete this transaction?';

  @override
  String deleteConfirmBody(String label) {
    return '\"$label\" will be deleted.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get undo => 'Undo';

  @override
  String get transactionDeleted => 'Transaction deleted';

  @override
  String get deleteTransactionAction => 'Delete the transaction';

  @override
  String get editTransactionHint => 'edit';

  @override
  String get editTransactionTitle => 'Edit transaction';

  @override
  String get transactionUpdated => 'Transaction updated';

  @override
  String get loadingMore => 'Loading…';

  @override
  String get periodPrevious => 'Previous period';

  @override
  String get periodNext => 'Next period';

  @override
  String periodRange(String start, String end) {
    return '$start to $end';
  }

  @override
  String weekEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'This week you earned $amountString FCFA';
  }

  @override
  String weekLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'This week you lost $amountString FCFA';
  }

  @override
  String monthEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'This month you earned $amountString FCFA';
  }

  @override
  String monthLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'This month you lost $amountString FCFA';
  }

  @override
  String pastEarned(String period, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$period: you earned $amountString FCFA';
  }

  @override
  String pastLost(String period, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$period: you lost $amountString FCFA';
  }

  @override
  String previousMore(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'That\'s $amountString FCFA more than the previous period';
  }

  @override
  String previousLess(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'That\'s $amountString FCFA less than the previous period';
  }

  @override
  String previousMorePercent(int amount, int percent) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat percentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String percentString = percentNumberFormat.format(percent);

    return 'That\'s $amountString FCFA more than the previous period (+$percentString%)';
  }

  @override
  String previousLessPercent(int amount, int percent) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat percentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String percentString = percentNumberFormat.format(percent);

    return 'That\'s $amountString FCFA less than the previous period (−$percentString%)';
  }

  @override
  String get previousSame => 'Same as the previous period';

  @override
  String get dailyChartTitle => 'Profit per day';

  @override
  String get categoriesTitle => 'By category';

  @override
  String get noDataForPeriod => 'No transactions in this period.';

  @override
  String profitSemantics(String label, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$label: $amountString FCFA profit';
  }

  @override
  String lossSemantics(String label, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$label: $amountString FCFA loss';
  }

  @override
  String chartSummary(
    String period,
    int total,
    String bestDay,
    int bestAmount,
  ) {
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);
    final intl.NumberFormat bestAmountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String bestAmountString = bestAmountNumberFormat.format(bestAmount);

    return 'Profit per day, $period: total $totalString FCFA. Best day: $bestDay, $bestAmountString FCFA.';
  }

  @override
  String chartSummaryEmpty(String period) {
    return 'Profit per day, $period: no transactions.';
  }

  @override
  String get historyError => 'Unable to load the history.';
}
