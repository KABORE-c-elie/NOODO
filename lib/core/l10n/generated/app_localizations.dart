import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fr'),
    Locale('en'),
  ];

  /// Nom de l'application
  ///
  /// In fr, this message translates to:
  /// **'NOODO'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get homeTitle;

  /// No description provided for @confirmationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Confirmation'**
  String get confirmationTitle;

  /// No description provided for @historyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get historyTitle;

  /// No description provided for @profitsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes bénéfices'**
  String get profitsTitle;

  /// No description provided for @nodesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes nœuds'**
  String get nodesTitle;

  /// No description provided for @creditorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Fiche créancier'**
  String get creditorTitle;

  /// No description provided for @receiptsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Photothèque'**
  String get receiptsTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settingsTitle;

  /// No description provided for @transactionTypeSale.
  ///
  /// In fr, this message translates to:
  /// **'Vente'**
  String get transactionTypeSale;

  /// No description provided for @transactionTypeExpense.
  ///
  /// In fr, this message translates to:
  /// **'Dépense'**
  String get transactionTypeExpense;

  /// No description provided for @amountFcfa.
  ///
  /// In fr, this message translates to:
  /// **'{amount} FCFA'**
  String amountFcfa(int amount);

  /// No description provided for @navHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navHome;

  /// No description provided for @navHistory.
  ///
  /// In fr, this message translates to:
  /// **'Historique'**
  String get navHistory;

  /// No description provided for @navProfits.
  ///
  /// In fr, this message translates to:
  /// **'Bénéfices'**
  String get navProfits;

  /// No description provided for @navNodes.
  ///
  /// In fr, this message translates to:
  /// **'Nœuds'**
  String get navNodes;

  /// No description provided for @openReceipts.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir la photothèque'**
  String get openReceipts;

  /// No description provided for @openSettings.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir les paramètres'**
  String get openSettings;

  /// No description provided for @todayEarned.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui tu as gagné {amount} FCFA'**
  String todayEarned(int amount);

  /// No description provided for @todayLost.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui tu as perdu {amount} FCFA'**
  String todayLost(int amount);

  /// No description provided for @comparedMore.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de plus qu\'hier'**
  String comparedMore(int amount);

  /// No description provided for @comparedLess.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de moins qu\'hier'**
  String comparedLess(int amount);

  /// No description provided for @comparedSame.
  ///
  /// In fr, this message translates to:
  /// **'Autant qu\'hier'**
  String get comparedSame;

  /// No description provided for @summaryError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de calculer le résumé du jour'**
  String get summaryError;

  /// No description provided for @recentTransactions.
  ///
  /// In fr, this message translates to:
  /// **'Dernières transactions'**
  String get recentTransactions;

  /// No description provided for @noTransactions.
  ///
  /// In fr, this message translates to:
  /// **'Aucune transaction pour l\'instant. Appuie sur le micro pour commencer.'**
  String get noTransactions;

  /// No description provided for @recordTransaction.
  ///
  /// In fr, this message translates to:
  /// **'Dicter une transaction'**
  String get recordTransaction;

  /// No description provided for @saleAmount.
  ///
  /// In fr, this message translates to:
  /// **'+{amount} FCFA'**
  String saleAmount(int amount);

  /// No description provided for @expenseAmount.
  ///
  /// In fr, this message translates to:
  /// **'−{amount} FCFA'**
  String expenseAmount(int amount);

  /// No description provided for @transcriptLabel.
  ///
  /// In fr, this message translates to:
  /// **'Ce que tu as dit'**
  String get transcriptLabel;

  /// No description provided for @transcriptHint.
  ///
  /// In fr, this message translates to:
  /// **'Ex. : J\'ai vendu 2 tas de tomates à 1 000 francs'**
  String get transcriptHint;

  /// No description provided for @analyze.
  ///
  /// In fr, this message translates to:
  /// **'Analyser'**
  String get analyze;

  /// No description provided for @analyzeTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Analyser la phrase'**
  String get analyzeTooltip;

  /// No description provided for @typeLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type'**
  String get typeLabel;

  /// No description provided for @amountLabel.
  ///
  /// In fr, this message translates to:
  /// **'Montant (FCFA)'**
  String get amountLabel;

  /// No description provided for @quantityLabel.
  ///
  /// In fr, this message translates to:
  /// **'Quantité'**
  String get quantityLabel;

  /// No description provided for @unitLabel.
  ///
  /// In fr, this message translates to:
  /// **'Unité'**
  String get unitLabel;

  /// No description provided for @noUnit.
  ///
  /// In fr, this message translates to:
  /// **'Aucune'**
  String get noUnit;

  /// No description provided for @productLabel.
  ///
  /// In fr, this message translates to:
  /// **'Produit'**
  String get productLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In fr, this message translates to:
  /// **'Catégorie'**
  String get categoryLabel;

  /// No description provided for @categoryVegetables.
  ///
  /// In fr, this message translates to:
  /// **'Légumes'**
  String get categoryVegetables;

  /// No description provided for @categoryCereals.
  ///
  /// In fr, this message translates to:
  /// **'Céréales'**
  String get categoryCereals;

  /// No description provided for @categoryTransport.
  ///
  /// In fr, this message translates to:
  /// **'Transport'**
  String get categoryTransport;

  /// No description provided for @categorySupplies.
  ///
  /// In fr, this message translates to:
  /// **'Fournitures'**
  String get categorySupplies;

  /// No description provided for @categoryOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get categoryOther;

  /// No description provided for @lowConfidenceWarning.
  ///
  /// In fr, this message translates to:
  /// **'Je n\'ai peut-être pas bien compris. Vérifie les champs signalés.'**
  String get lowConfidenceWarning;

  /// No description provided for @fieldToCheck.
  ///
  /// In fr, this message translates to:
  /// **'À vérifier'**
  String get fieldToCheck;

  /// No description provided for @unknownUnit.
  ///
  /// In fr, this message translates to:
  /// **'Unité inconnue : « {unit} »'**
  String unknownUnit(String unit);

  /// No description provided for @addThisUnit.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter cette unité'**
  String get addThisUnit;

  /// No description provided for @addUnitTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter « {unit} » à tes unités'**
  String addUnitTooltip(String unit);

  /// No description provided for @unitAdded.
  ///
  /// In fr, this message translates to:
  /// **'Unité « {unit} » ajoutée'**
  String unitAdded(String unit);

  /// No description provided for @save.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get save;

  /// No description provided for @saveTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer la transaction'**
  String get saveTooltip;

  /// No description provided for @transactionSaved.
  ///
  /// In fr, this message translates to:
  /// **'Transaction enregistrée'**
  String get transactionSaved;

  /// No description provided for @stopListening.
  ///
  /// In fr, this message translates to:
  /// **'Arrêter l\'écoute'**
  String get stopListening;

  /// No description provided for @listening.
  ///
  /// In fr, this message translates to:
  /// **'Je t\'écoute…'**
  String get listening;

  /// No description provided for @manualEntry.
  ///
  /// In fr, this message translates to:
  /// **'Écrire à la main'**
  String get manualEntry;

  /// No description provided for @manualEntryTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Saisir la transaction au clavier'**
  String get manualEntryTooltip;

  /// No description provided for @speechPermissionDenied.
  ///
  /// In fr, this message translates to:
  /// **'Je n\'ai pas accès au micro. Autorise-le dans les réglages du téléphone, ou écris ta transaction.'**
  String get speechPermissionDenied;

  /// No description provided for @speechUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'La reconnaissance vocale n\'est pas disponible pour le moment (pas de réseau ou langue non téléchargée). Tu peux écrire ta transaction.'**
  String get speechUnavailable;

  /// No description provided for @speechNoSpeech.
  ///
  /// In fr, this message translates to:
  /// **'Je n\'ai rien entendu. Appuie sur le micro pour réessayer, ou écris ta transaction.'**
  String get speechNoSpeech;

  /// No description provided for @transactionSemantics.
  ///
  /// In fr, this message translates to:
  /// **'{type} : {product}, {amount} FCFA'**
  String transactionSemantics(String type, String product, int amount);

  /// No description provided for @periodLabel.
  ///
  /// In fr, this message translates to:
  /// **'Période'**
  String get periodLabel;

  /// No description provided for @periodAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout'**
  String get periodAll;

  /// No description provided for @periodDay.
  ///
  /// In fr, this message translates to:
  /// **'Jour'**
  String get periodDay;

  /// No description provided for @periodWeek.
  ///
  /// In fr, this message translates to:
  /// **'Semaine'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In fr, this message translates to:
  /// **'Mois'**
  String get periodMonth;

  /// No description provided for @typeAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout'**
  String get typeAll;

  /// No description provided for @filterSales.
  ///
  /// In fr, this message translates to:
  /// **'Ventes'**
  String get filterSales;

  /// No description provided for @filterExpenses.
  ///
  /// In fr, this message translates to:
  /// **'Dépenses'**
  String get filterExpenses;

  /// No description provided for @categoryAll.
  ///
  /// In fr, this message translates to:
  /// **'Toutes'**
  String get categoryAll;

  /// No description provided for @historyEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune transaction pour ces filtres.'**
  String get historyEmpty;

  /// No description provided for @dayProfit.
  ///
  /// In fr, this message translates to:
  /// **'Bénéfice : {amount} FCFA'**
  String dayProfit(int amount);

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer cette transaction ?'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmBody.
  ///
  /// In fr, this message translates to:
  /// **'« {label} » sera supprimée.'**
  String deleteConfirmBody(String label);

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get delete;

  /// No description provided for @undo.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get undo;

  /// No description provided for @transactionDeleted.
  ///
  /// In fr, this message translates to:
  /// **'Transaction supprimée'**
  String get transactionDeleted;

  /// No description provided for @deleteTransactionAction.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la transaction'**
  String get deleteTransactionAction;

  /// No description provided for @editTransactionHint.
  ///
  /// In fr, this message translates to:
  /// **'modifier'**
  String get editTransactionHint;

  /// No description provided for @editTransactionTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la transaction'**
  String get editTransactionTitle;

  /// No description provided for @transactionUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Transaction modifiée'**
  String get transactionUpdated;

  /// No description provided for @loadingMore.
  ///
  /// In fr, this message translates to:
  /// **'Chargement…'**
  String get loadingMore;

  /// No description provided for @periodPrevious.
  ///
  /// In fr, this message translates to:
  /// **'Période précédente'**
  String get periodPrevious;

  /// No description provided for @periodNext.
  ///
  /// In fr, this message translates to:
  /// **'Période suivante'**
  String get periodNext;

  /// No description provided for @periodRange.
  ///
  /// In fr, this message translates to:
  /// **'du {start} au {end}'**
  String periodRange(String start, String end);

  /// No description provided for @weekEarned.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine tu as gagné {amount} FCFA'**
  String weekEarned(int amount);

  /// No description provided for @weekLost.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine tu as perdu {amount} FCFA'**
  String weekLost(int amount);

  /// No description provided for @monthEarned.
  ///
  /// In fr, this message translates to:
  /// **'Ce mois-ci tu as gagné {amount} FCFA'**
  String monthEarned(int amount);

  /// No description provided for @monthLost.
  ///
  /// In fr, this message translates to:
  /// **'Ce mois-ci tu as perdu {amount} FCFA'**
  String monthLost(int amount);

  /// No description provided for @pastEarned.
  ///
  /// In fr, this message translates to:
  /// **'{period} : tu as gagné {amount} FCFA'**
  String pastEarned(String period, int amount);

  /// No description provided for @pastLost.
  ///
  /// In fr, this message translates to:
  /// **'{period} : tu as perdu {amount} FCFA'**
  String pastLost(String period, int amount);

  /// No description provided for @previousMore.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de plus que la période précédente'**
  String previousMore(int amount);

  /// No description provided for @previousLess.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de moins que la période précédente'**
  String previousLess(int amount);

  /// No description provided for @previousMorePercent.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de plus que la période précédente (+{percent} %)'**
  String previousMorePercent(int amount, int percent);

  /// No description provided for @previousLessPercent.
  ///
  /// In fr, this message translates to:
  /// **'C\'est {amount} FCFA de moins que la période précédente (−{percent} %)'**
  String previousLessPercent(int amount, int percent);

  /// No description provided for @previousSame.
  ///
  /// In fr, this message translates to:
  /// **'Autant que la période précédente'**
  String get previousSame;

  /// No description provided for @dailyChartTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bénéfice par jour'**
  String get dailyChartTitle;

  /// No description provided for @categoriesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Par catégorie'**
  String get categoriesTitle;

  /// No description provided for @noDataForPeriod.
  ///
  /// In fr, this message translates to:
  /// **'Aucune transaction sur cette période.'**
  String get noDataForPeriod;

  /// No description provided for @profitSemantics.
  ///
  /// In fr, this message translates to:
  /// **'{label} : {amount} FCFA de bénéfice'**
  String profitSemantics(String label, int amount);

  /// No description provided for @lossSemantics.
  ///
  /// In fr, this message translates to:
  /// **'{label} : {amount} FCFA de perte'**
  String lossSemantics(String label, int amount);

  /// No description provided for @chartSummary.
  ///
  /// In fr, this message translates to:
  /// **'Bénéfice par jour, {period} : total {total} FCFA. Meilleur jour : {bestDay}, {bestAmount} FCFA.'**
  String chartSummary(String period, int total, String bestDay, int bestAmount);

  /// No description provided for @chartSummaryEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Bénéfice par jour, {period} : aucune transaction.'**
  String chartSummaryEmpty(String period);

  /// No description provided for @historyError.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger l\'historique.'**
  String get historyError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
