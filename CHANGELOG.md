# Journal des modifications

Toutes les modifications notables de NOODO sont consignées dans ce fichier.

Le format suit [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/) et le projet respecte le [versionnage sémantique](https://semver.org/lang/fr/). Les dates sont celles des commits.

## [Non publié]

### Ajouté
- `README.md`, `CHANGELOG.md` et fichier `LICENSE` (tous droits réservés).
- Dossier `docs/screenshots/` pour les captures du README.

### À venir (étape 9)
- Séance de tests sur téléphone réel : voix (permission, mode avion, bruit), appareil photo, notifications.
- Exécution des tests d'intégration sur le TECNO KM5.
- Mesure des performances en mode profile sur 2 000 transactions.

## [1.0.0] - 2026-10-11

### Ajouté
- **Paramètres** : langue français / anglais (appliquée à l'app et à la reconnaissance vocale), taux d'épargne impôts de 0 à 10 % par pas de 0,5 %, date de la prochaine échéance fiscale, sensibilité des alertes, thème Système / Clair / Sombre.
- **Photothèque** : photo de reçu prise avec l'appareil (compressée), rangée chez un créancier et liée à un paiement ou à une transaction, grille filtrable par créancier et par date, photos visibles dans la fiche créancier, suppression avec confirmation.
- **Rappels** : échéance des impôts à 15 puis 5 jours, échéance de chaque créancier la veille, reprogrammés à chaque changement et annulés quand un créancier est soldé ; permission demandée au moment où une échéance est saisie.
- **Détection d'anomalies** : dépense nettement supérieure à la moyenne de sa catégorie sur 30 jours, bénéfice de la veille très inférieur à la moyenne des 7 jours précédents ; une alerte au plus par jour et par type, avec un conseil, refermable.
- **Plusieurs transactions dans une phrase** : découpage sur « et », « puis », virgules…, verbe hérité, prix unitaire (« 2 tas de 1000 F », « chacun », « le tas ») avec le calcul affiché, une carte par transaction et « Tout enregistrer » en une seule transaction SQLite.
- **Thème** : palettes claire et sombre conçues séparément autour de l'orange NOODO, couleurs métier (`AppColors`), police Nunito embarquée, espacements et arrondis partagés, contraste WCAG AA vérifié par des tests.
- Tests golden de l'Accueil et de la Confirmation en clair et en sombre.
- Tests d'intégration (parcours vente et parcours créancier) et outils de développement réservés au mode debug (2 000 transactions de démonstration, rappel de test).

### Modifié
- Base de données en version 4 (réglages, photos, alertes fermées, thème), avec migrations testées depuis la version 1.
- Les dépenses créées par un paiement de créancier sont liées au paiement : dans l'Historique, elles ouvrent la fiche du créancier et ne sont ni modifiables ni supprimables.
- Les montants négatifs s'écrivent avec le signe « − », un montant nul s'affiche en couleur neutre, et le graphique des bénéfices porte une étiquette par jour.
- Les lignes de filtres défilantes s'estompent sur les bords pour signaler qu'elles défilent.

### Corrigé
- Le rangement d'une photo échouait après la prise de vue (fournisseur Riverpod libéré pendant l'attente).
- La ligne « Unité inconnue / Ajouter cette unité » débordait dans une carte sur un écran de 360 px.
- « 2 tas de tomates de 1000 francs » est maintenant compris comme 2 × 1 000 FCFA.
- Un segment de transport sans verbe n'hérite plus d'une vente : il est signalé « À vérifier ».
- Le ruban « DEBUG » n'apparaît plus.

## [0.3.0] - 2026-10-10

### Ajouté
- **Nœuds** : carte Nœud Impôts (solde épargné, taux), liste des Nœuds Créanciers triés par échéance avec badge « En retard », ajout d'un créancier.
- **Épargne impôts automatique** : à chaque vente, la part calculée en points de base est ajoutée au Nœud Impôts dans la même transaction SQLite ; modification et suppression corrigent le solde.
- **Fiche créancier** : solde dû, échéance, total payé, enregistrement d'un paiement (espèces, Orange Money, Moov Money — simulés) qui réduit le solde et crée une dépense, historique des paiements.
- **Reçus de paiement** numérotés `Rec-AAAA-NNNN` (séquence annuelle en base), au format du document fonctionnel, partageables par WhatsApp, SMS…

### Modifié
- Base de données en version 2, avec la première migration.
- Filtres de l'Historique sur une seule ligne de chips défilante, catégorie dans un panneau du bas.

### Corrigé
- En-têtes de jour de l'Historique illisibles sur un écran étroit.
- Panneau des catégories qui débordait sur un petit téléphone.

## [0.2.0] - 2026-10-10

### Ajouté
- **Navigation** : barre du bas (Accueil, Historique, Bénéfices, Nœuds), Photothèque et Paramètres depuis l'Accueil.
- **Accueil** : résumé du jour en une phrase, comparaison avec la veille, dernières transactions, grand bouton micro.
- **Confirmation** : analyse de la phrase, champs modifiables, mise en évidence des champs à vérifier, ajout d'une unité inconnue.
- **Enregistrement vocal** avec `speech_to_text` en français, texte partiel en direct, saisie manuelle toujours accessible, messages clairs en cas de permission refusée, de reconnaissance indisponible ou de silence.
- **Historique** groupé par jour, filtres, chargement par pages, modification et suppression avec annulation.
- **Bénéfices** par jour, semaine ou mois : comparaison avec la période précédente, répartition par catégorie, graphique dessiné sans package externe.
- Rafraîchissement du résumé à minuit et au retour au premier plan.
- Intégration continue GitHub Actions : code généré à jour, formatage, analyse, tests.

### Corrigé
- L'Accueil débordait sur un petit écran : il défile désormais.
- Le message « Annuler » après une suppression restait affiché indéfiniment.

## [0.1.0] - 2026-10-10

### Ajouté
- Projet Flutter `noodo` (Riverpod 3, freezed, go_router, drift), architecture par fonctionnalités, français par défaut et anglais.
- Modèles du domaine : transaction, unité locale, nœud créancier, nœud impôts.
- **Analyseur de transactions** en Dart pur : vente ou dépense, montants en chiffres ou en lettres, quantités, unités locales au singulier et au pluriel, catégories, score de confiance.
- **Couche données** : repositories drift, calcul des bénéfices et de l'épargne impôts, provider du résumé du jour.

### Modifié
- Fins de ligne normalisées en LF.

[Non publié]: https://github.com/KABORE-c-elie/NOODO/compare/799885c...dev
[1.0.0]: https://github.com/KABORE-c-elie/NOODO/compare/b927a78...799885c
[0.3.0]: https://github.com/KABORE-c-elie/NOODO/compare/4f11d45...b927a78
[0.2.0]: https://github.com/KABORE-c-elie/NOODO/compare/5d70945...4f11d45
[0.1.0]: https://github.com/KABORE-c-elie/NOODO/commits/5d70945
