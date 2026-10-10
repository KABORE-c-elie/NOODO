// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'NOODO';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get confirmationTitle => 'Confirmation';

  @override
  String get historyTitle => 'Historique';

  @override
  String get profitsTitle => 'Mes bénéfices';

  @override
  String get nodesTitle => 'Mes nœuds';

  @override
  String get creditorTitle => 'Fiche créancier';

  @override
  String get receiptsTitle => 'Photothèque';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get transactionTypeSale => 'Vente';

  @override
  String get transactionTypeExpense => 'Dépense';

  @override
  String amountFcfa(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString FCFA';
  }

  @override
  String get navHome => 'Accueil';

  @override
  String get navHistory => 'Historique';

  @override
  String get navProfits => 'Bénéfices';

  @override
  String get navNodes => 'Nœuds';

  @override
  String get openReceipts => 'Ouvrir la photothèque';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String todayEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Aujourd\'hui tu as gagné $amountString FCFA';
  }

  @override
  String todayLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Aujourd\'hui tu as perdu $amountString FCFA';
  }

  @override
  String comparedMore(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'C\'est $amountString FCFA de plus qu\'hier';
  }

  @override
  String comparedLess(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'C\'est $amountString FCFA de moins qu\'hier';
  }

  @override
  String get comparedSame => 'Autant qu\'hier';

  @override
  String get summaryError => 'Impossible de calculer le résumé du jour';

  @override
  String get recentTransactions => 'Dernières transactions';

  @override
  String get noTransactions =>
      'Aucune transaction pour l\'instant. Appuie sur le micro pour commencer.';

  @override
  String get recordTransaction => 'Dicter une transaction';

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
  String get transcriptLabel => 'Ce que tu as dit';

  @override
  String get transcriptHint =>
      'Ex. : J\'ai vendu 2 tas de tomates à 1 000 francs';

  @override
  String get analyze => 'Analyser';

  @override
  String get analyzeTooltip => 'Analyser la phrase';

  @override
  String get typeLabel => 'Type';

  @override
  String get amountLabel => 'Montant (FCFA)';

  @override
  String get quantityLabel => 'Quantité';

  @override
  String get unitLabel => 'Unité';

  @override
  String get noUnit => 'Aucune';

  @override
  String get productLabel => 'Produit';

  @override
  String get categoryLabel => 'Catégorie';

  @override
  String get categoryVegetables => 'Légumes';

  @override
  String get categoryCereals => 'Céréales';

  @override
  String get categoryTransport => 'Transport';

  @override
  String get categorySupplies => 'Fournitures';

  @override
  String get categoryOther => 'Autre';

  @override
  String get lowConfidenceWarning =>
      'Je n\'ai peut-être pas bien compris. Vérifie les champs signalés.';

  @override
  String get fieldToCheck => 'À vérifier';

  @override
  String unknownUnit(String unit) {
    return 'Unité inconnue : « $unit »';
  }

  @override
  String get addThisUnit => 'Ajouter cette unité';

  @override
  String addUnitTooltip(String unit) {
    return 'Ajouter « $unit » à tes unités';
  }

  @override
  String unitAdded(String unit) {
    return 'Unité « $unit » ajoutée';
  }

  @override
  String get save => 'Enregistrer';

  @override
  String get saveTooltip => 'Enregistrer la transaction';

  @override
  String get transactionSaved => 'Transaction enregistrée';

  @override
  String get stopListening => 'Arrêter l\'écoute';

  @override
  String get listening => 'Je t\'écoute…';

  @override
  String get manualEntry => 'Écrire à la main';

  @override
  String get manualEntryTooltip => 'Saisir la transaction au clavier';

  @override
  String get speechPermissionDenied =>
      'Je n\'ai pas accès au micro. Autorise-le dans les réglages du téléphone, ou écris ta transaction.';

  @override
  String get speechUnavailable =>
      'La reconnaissance vocale n\'est pas disponible pour le moment (pas de réseau ou langue non téléchargée). Tu peux écrire ta transaction.';

  @override
  String get speechNoSpeech =>
      'Je n\'ai rien entendu. Appuie sur le micro pour réessayer, ou écris ta transaction.';

  @override
  String transactionSemantics(String type, String product, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$type : $product, $amountString FCFA';
  }

  @override
  String get periodLabel => 'Période';

  @override
  String get periodAll => 'Tout';

  @override
  String get periodDay => 'Jour';

  @override
  String get periodWeek => 'Semaine';

  @override
  String get periodMonth => 'Mois';

  @override
  String get typeAll => 'Tout';

  @override
  String get filterSales => 'Ventes';

  @override
  String get filterExpenses => 'Dépenses';

  @override
  String get categoryAll => 'Toutes';

  @override
  String get historyEmpty => 'Aucune transaction pour ces filtres.';

  @override
  String dayProfit(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Bénéfice : $amountString FCFA';
  }

  @override
  String get deleteConfirmTitle => 'Supprimer cette transaction ?';

  @override
  String deleteConfirmBody(String label) {
    return '« $label » sera supprimée.';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get undo => 'Annuler';

  @override
  String get transactionDeleted => 'Transaction supprimée';

  @override
  String get deleteTransactionAction => 'Supprimer la transaction';

  @override
  String get editTransactionHint => 'modifier';

  @override
  String get editTransactionTitle => 'Modifier la transaction';

  @override
  String get transactionUpdated => 'Transaction modifiée';

  @override
  String get loadingMore => 'Chargement…';

  @override
  String get periodPrevious => 'Période précédente';

  @override
  String get periodNext => 'Période suivante';

  @override
  String periodRange(String start, String end) {
    return 'du $start au $end';
  }

  @override
  String weekEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Cette semaine tu as gagné $amountString FCFA';
  }

  @override
  String weekLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Cette semaine tu as perdu $amountString FCFA';
  }

  @override
  String monthEarned(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Ce mois-ci tu as gagné $amountString FCFA';
  }

  @override
  String monthLost(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Ce mois-ci tu as perdu $amountString FCFA';
  }

  @override
  String pastEarned(String period, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$period : tu as gagné $amountString FCFA';
  }

  @override
  String pastLost(String period, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$period : tu as perdu $amountString FCFA';
  }

  @override
  String previousMore(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'C\'est $amountString FCFA de plus que la période précédente';
  }

  @override
  String previousLess(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'C\'est $amountString FCFA de moins que la période précédente';
  }

  @override
  String previousMorePercent(int amount, int percent) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat percentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String percentString = percentNumberFormat.format(percent);

    return 'C\'est $amountString FCFA de plus que la période précédente (+$percentString %)';
  }

  @override
  String previousLessPercent(int amount, int percent) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);
    final intl.NumberFormat percentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String percentString = percentNumberFormat.format(percent);

    return 'C\'est $amountString FCFA de moins que la période précédente (−$percentString %)';
  }

  @override
  String get previousSame => 'Autant que la période précédente';

  @override
  String get dailyChartTitle => 'Bénéfice par jour';

  @override
  String get categoriesTitle => 'Par catégorie';

  @override
  String get noDataForPeriod => 'Aucune transaction sur cette période.';

  @override
  String profitSemantics(String label, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$label : $amountString FCFA de bénéfice';
  }

  @override
  String lossSemantics(String label, int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return '$label : $amountString FCFA de perte';
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

    return 'Bénéfice par jour, $period : total $totalString FCFA. Meilleur jour : $bestDay, $bestAmountString FCFA.';
  }

  @override
  String chartSummaryEmpty(String period) {
    return 'Bénéfice par jour, $period : aucune transaction.';
  }

  @override
  String get historyError => 'Impossible de charger l\'historique.';

  @override
  String get filters => 'Filtres';

  @override
  String get filtersTooltip => 'Filtrer par catégorie';

  @override
  String get clearCategoryFilter => 'Retirer le filtre de catégorie';

  @override
  String transactionSavedWithTax(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Transaction enregistrée · $amountString FCFA mis de côté pour tes impôts';
  }

  @override
  String get taxNodeTitle => 'Nœud Impôts';

  @override
  String taxSaved(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Épargné : $amountString FCFA';
  }

  @override
  String taxRate(String rate) {
    return 'Taux : $rate %';
  }

  @override
  String taxNextDue(String date) {
    return 'Prochaine échéance : $date';
  }

  @override
  String get taxNoDue => 'Aucune échéance renseignée';

  @override
  String get creditorsTitle => 'Mes créanciers';

  @override
  String get noCreditors => 'Aucun créancier pour l\'instant.';

  @override
  String get addCreditor => 'Ajouter un créancier';

  @override
  String get addCreditorTooltip =>
      'Ajouter un fournisseur à qui tu dois de l\'argent';

  @override
  String get overdue => 'En retard';

  @override
  String dueOn(String date) {
    return 'Échéance : $date';
  }

  @override
  String get noDueDate => 'Sans échéance';

  @override
  String balanceDue(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Reste à payer : $amountString FCFA';
  }

  @override
  String get creditorNameLabel => 'Nom du fournisseur';

  @override
  String get creditorPhoneLabel => 'Téléphone (facultatif)';

  @override
  String get amountDueLabel => 'Montant dû (FCFA)';

  @override
  String get dueDateLabel => 'Échéance (facultatif)';

  @override
  String get chooseDueDate => 'Choisir une échéance';

  @override
  String get clearDueDate => 'Retirer l\'échéance';

  @override
  String get requiredField => 'Obligatoire';

  @override
  String get invalidAmount => 'Montant invalide';

  @override
  String get creditorAdded => 'Créancier ajouté';

  @override
  String totalPaid(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Déjà payé : $amountString FCFA';
  }

  @override
  String get recordPayment => 'Enregistrer un paiement';

  @override
  String get recordPaymentTooltip => 'Enregistrer un paiement à ce fournisseur';

  @override
  String get paymentAmountLabel => 'Montant payé (FCFA)';

  @override
  String get paymentMethodLabel => 'Moyen de paiement';

  @override
  String get methodCash => 'Espèces';

  @override
  String get methodOrangeMoney => 'Orange Money';

  @override
  String get methodMoovMoney => 'Moov Money';

  @override
  String get paymentReasonLabel => 'Motif (facultatif)';

  @override
  String amountTooHigh(int max) {
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String maxString = maxNumberFormat.format(max);

    return 'Maximum : $maxString FCFA';
  }

  @override
  String get confirmPayment => 'Valider le paiement';

  @override
  String get paymentsTitle => 'Paiements';

  @override
  String get noPayments => 'Aucun paiement pour l\'instant.';

  @override
  String get creditorNotFound => 'Créancier introuvable.';

  @override
  String paymentExpenseText(String name) {
    return 'Paiement à $name';
  }

  @override
  String paymentSummary(String date, String method, String number) {
    return '$date · $method · $number';
  }

  @override
  String get viewReceiptHint => 'voir le reçu';

  @override
  String get receiptTitle => 'Reçu de paiement';

  @override
  String get share => 'Partager';

  @override
  String get shareReceiptTooltip => 'Partager le reçu par WhatsApp, SMS…';

  @override
  String get close => 'Fermer';

  @override
  String receiptShareSubject(String number) {
    return 'Reçu $number';
  }

  @override
  String get receiptHeader => 'NOODO — ACCUSÉ DE PAIEMENT';

  @override
  String receiptNumberLine(String number, String date) {
    return 'N° $number | Date : $date';
  }

  @override
  String receiptDateTime(String date, String time) {
    return '$date à $time';
  }

  @override
  String receiptTime(String hour, String minute) {
    return '${hour}h$minute';
  }

  @override
  String receiptCreditorLine(String name) {
    return 'Créancier / Fournisseur : $name';
  }

  @override
  String receiptPhoneLine(String phone) {
    return 'Numéro : $phone';
  }

  @override
  String receiptAmountLine(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Montant payé : $amountString FCFA';
  }

  @override
  String receiptMethodLine(String method) {
    return 'Moyen : $method';
  }

  @override
  String receiptMobileMoney(String operator) {
    return 'Mobile Money ($operator)';
  }

  @override
  String receiptReasonLine(String reason) {
    return 'Motif : $reason';
  }

  @override
  String receiptRemainingLine(int amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String amountString = amountNumberFormat.format(amount);

    return 'Reste à devoir : $amountString FCFA';
  }
}
