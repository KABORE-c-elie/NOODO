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
}
