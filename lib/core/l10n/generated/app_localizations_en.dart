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

  @override
  String get filters => 'Filters';

  @override
  String get filtersTooltip => 'Filter by category';

  @override
  String get clearCategoryFilter => 'Remove the category filter';

  @override
  String transactionSavedWithTax(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Transaction saved · $amountString FCFA set aside for your taxes';
  }

  @override
  String get taxNodeTitle => 'Tax node';

  @override
  String taxSaved(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Saved: $amountString FCFA';
  }

  @override
  String taxRate(String rate) {
    return 'Rate: $rate%';
  }

  @override
  String taxNextDue(String date) {
    return 'Next due date: $date';
  }

  @override
  String get taxNoDue => 'No due date set';

  @override
  String get creditorsTitle => 'My creditors';

  @override
  String get noCreditors => 'No creditors yet.';

  @override
  String get addCreditor => 'Add a creditor';

  @override
  String get addCreditorTooltip => 'Add a supplier you owe money to';

  @override
  String get overdue => 'Overdue';

  @override
  String dueOn(String date) {
    return 'Due: $date';
  }

  @override
  String get noDueDate => 'No due date';

  @override
  String balanceDue(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Left to pay: $amountString FCFA';
  }

  @override
  String get creditorNameLabel => 'Supplier name';

  @override
  String get creditorPhoneLabel => 'Phone (optional)';

  @override
  String get amountDueLabel => 'Amount owed (FCFA)';

  @override
  String get dueDateLabel => 'Due date (optional)';

  @override
  String get chooseDueDate => 'Choose a due date';

  @override
  String get clearDueDate => 'Remove the due date';

  @override
  String get requiredField => 'Required';

  @override
  String get invalidAmount => 'Invalid amount';

  @override
  String get creditorAdded => 'Creditor added';

  @override
  String totalPaid(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Already paid: $amountString FCFA';
  }

  @override
  String get recordPayment => 'Record a payment';

  @override
  String get recordPaymentTooltip => 'Record a payment to this supplier';

  @override
  String get paymentAmountLabel => 'Amount paid (FCFA)';

  @override
  String get paymentMethodLabel => 'Payment method';

  @override
  String get methodCash => 'Cash';

  @override
  String get methodOrangeMoney => 'Orange Money';

  @override
  String get methodMoovMoney => 'Moov Money';

  @override
  String get paymentReasonLabel => 'Reason (optional)';

  @override
  String amountTooHigh(int max) {
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String maxString = maxNumberFormat.format(max);

    return 'Maximum: $maxString FCFA';
  }

  @override
  String get confirmPayment => 'Confirm payment';

  @override
  String get paymentsTitle => 'Payments';

  @override
  String get noPayments => 'No payments yet.';

  @override
  String get creditorNotFound => 'Creditor not found.';

  @override
  String paymentExpenseText(String name) {
    return 'Payment to $name';
  }

  @override
  String paymentSummary(String date, String method, String number) {
    return '$date · $method · $number';
  }

  @override
  String get viewReceiptHint => 'view the receipt';

  @override
  String get receiptTitle => 'Payment receipt';

  @override
  String get share => 'Share';

  @override
  String get shareReceiptTooltip => 'Share the receipt via WhatsApp, SMS…';

  @override
  String get close => 'Close';

  @override
  String receiptShareSubject(String number) {
    return 'Receipt $number';
  }

  @override
  String get receiptHeader => 'NOODO — PAYMENT RECEIPT';

  @override
  String receiptNumberLine(String number, String date) {
    return 'No. $number | Date: $date';
  }

  @override
  String receiptDateTime(String date, String time) {
    return '$date at $time';
  }

  @override
  String receiptTime(String hour, String minute) {
    return '$hour:$minute';
  }

  @override
  String receiptCreditorLine(String name) {
    return 'Creditor / Supplier: $name';
  }

  @override
  String receiptPhoneLine(String phone) {
    return 'Phone: $phone';
  }

  @override
  String receiptAmountLine(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Amount paid: $amountString FCFA';
  }

  @override
  String receiptMethodLine(String method) {
    return 'Method: $method';
  }

  @override
  String receiptMobileMoney(String operator) {
    return 'Mobile Money ($operator)';
  }

  @override
  String receiptReasonLine(String reason) {
    return 'Reason: $reason';
  }

  @override
  String receiptRemainingLine(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Still owed: $amountString FCFA';
  }

  @override
  String get openCreditorHint => 'open the creditor details';

  @override
  String get notificationsDenied =>
      'Without notification permission, NOODO can\'t remind you of due dates. You can enable it in your phone settings.';

  @override
  String get taxReminderTitle => 'Tax due date';

  @override
  String taxReminderBody(int days, String date) {
    return '$days days left before the $date due date. Your tax node is ready.';
  }

  @override
  String creditorReminderTitle(String name) {
    return 'Tomorrow: payment to $name';
  }

  @override
  String creditorReminderBody(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString FCFA left to pay.';
  }

  @override
  String unusualExpenseMessage(
    String label,
    int amount,
    String category,
    int average,
  ) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat averageNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String averageString = averageNumberFormat.format(average);

    return '\"$label\": $amountString FCFA, much more than usual for $category ($averageString FCFA on average).';
  }

  @override
  String get unusualExpenseAdvice =>
      'Check the price and keep a photo of the receipt.';

  @override
  String lowProfitMessage(int amount, int average) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat averageNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String averageString = averageNumberFormat.format(average);

    return 'Yesterday your profit was $amountString FCFA, well below your average of $averageString FCFA.';
  }

  @override
  String get lowProfitAdvice =>
      'Check whether a purchase price went up or a sale was forgotten.';

  @override
  String get dismissAlert => 'Dismiss the alert';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get takePhotoTooltip => 'Photograph a receipt or an invoice';

  @override
  String get allCreditors => 'All creditors';

  @override
  String get filterByCreditor => 'Filter by creditor';

  @override
  String get allDates => 'All dates';

  @override
  String get filterByDate => 'Filter by date';

  @override
  String get clearFilter => 'Remove the filter';

  @override
  String get noPhotos => 'No photos yet.';

  @override
  String photoSemantics(String creditor, String date) {
    return 'Receipt photo: $creditor, $date';
  }

  @override
  String get photoNoCreditor => 'no creditor';

  @override
  String get attachPhotoTitle => 'File the photo';

  @override
  String get noCreditorsForPhoto =>
      'No creditors yet: the photo will be filed without a creditor.';

  @override
  String get photoCreditorLabel => 'Creditor';

  @override
  String get photoLinkLabel => 'Link to (optional)';

  @override
  String get photoNoLink => 'Nothing';

  @override
  String photoPaymentLink(String number, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Payment $number · $amountString FCFA';
  }

  @override
  String photoTransactionLink(String label, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$label · $amountString FCFA';
  }

  @override
  String get savePhotoTooltip => 'Save the photo';

  @override
  String get deletePhotoTitle => 'Delete this photo?';

  @override
  String get deletePhotoBody => 'The photo will be erased from the phone.';

  @override
  String get deletePhotoTooltip => 'Delete the photo';

  @override
  String get photosTitle => 'Photos';

  @override
  String get takePhotoForCreditorTooltip =>
      'Photograph a receipt from this creditor';

  @override
  String get languageSection => 'Language';

  @override
  String get taxSection => 'Taxes';

  @override
  String get alertsSection => 'Alerts';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageEnglish => 'English';

  @override
  String get taxRateExplanation =>
      'Share of each sale set aside in your tax node.';

  @override
  String get chooseTaxDueDate => 'Choose the next tax due date';

  @override
  String get sensitivityLow => 'Low';

  @override
  String get sensitivityNormal => 'Normal';

  @override
  String get sensitivityHigh => 'High';

  @override
  String get sensitivityLowHelp => 'Only very large deviations.';

  @override
  String get sensitivityNormalHelp => 'Clear deviations from your habits.';

  @override
  String get sensitivityHighHelp => 'Even small deviations: more alerts.';
}
