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
}
