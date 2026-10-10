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
}
