import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_router.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/presentation/screens/creditor_screen.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';
import 'package:noodo/features/receipts/data/drift_photo_repository.dart';
import 'package:noodo/features/receipts/domain/receipt_photo.dart';
import 'package:noodo/features/receipts/presentation/screens/receipts_screen.dart';
import 'package:noodo/features/receipts/presentation/widgets/photo_thumbnail.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/presentation/screens/history_screen.dart';

import '../helpers/fixtures.dart';
import '../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() => db = createMemoryDatabase());

  testWidgets(
    'Historique : dépense de paiement verrouillée, ouvre la fiche créancier',
    (tester) async {
      await tester.runAsync(() async {
        final nodes = DriftNodeRepository(db);
        await nodes.addCreditor(
          const CreditorNode(
            id: 'awa',
            supplierName: 'Maman Awa',
            balanceDueFcfa: 5000,
          ),
        );
        await nodes.recordPayment(
          PaymentRequest(
            paymentId: 'p1',
            transactionId: 'tx-p1',
            creditorId: 'awa',
            amountFcfa: 2000,
            method: PaymentMethod.cash,
            date: DateTime(2026, 10, 14, 9),
            expenseText: 'Paiement à Maman Awa',
          ),
        );
      });
      await pumpNoodoApp(
        tester,
        db: db,
        now: now,
        initialLocation: AppRoutes.history,
      );

      final tile = find.descendant(
        of: find.byType(HistoryScreen),
        matching: find.text('Maman Awa'),
      );
      expect(
        find.descendant(
          of: find.byType(HistoryScreen),
          matching: find.byIcon(Icons.receipt_long),
        ),
        findsOneWidget,
      );
      expect(find.byType(Dismissible), findsNothing);

      await tester.drag(tile, const Offset(-600, 0));
      await tester.pumpAndSettle();
      expect(find.text(frenchL10n.deleteConfirmTitle), findsNothing);
      expect(tile, findsOneWidget);

      await tester.tap(tile);
      await tester.pumpAndSettle();
      expect(find.byType(CreditorScreen), findsOneWidget);
      expect(find.text(frenchL10n.balanceDue(3000)), findsOneWidget);
      expect(find.text(frenchL10n.editTransactionTitle), findsNothing);

      await unmountApp(tester, db);
    },
  );

  testWidgets('changer de langue traduit toute l\'app', (tester) async {
    final container = await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.settings,
    );
    final english = lookupAppLocalizations(const Locale('en'));
    expect(find.text(frenchL10n.settingsTitle), findsOneWidget);

    await tester.tap(find.text(frenchL10n.languageEnglish));
    await tester.pumpAndSettle();

    expect(find.text(english.settingsTitle), findsOneWidget);
    expect(find.text(english.languageSection), findsOneWidget);
    expect(find.text(english.sensitivityNormal), findsOneWidget);
    expect(
      (await tester.runAsync(DriftSettingsRepository(db).get))!.languageCode,
      'en',
    );

    container.read(appRouterProvider).go(AppRoutes.home);
    await tester.pumpAndSettle();
    expect(find.text(english.homeTitle), findsWidgets);
    expect(find.text(english.todayEarned(0)), findsOneWidget);

    await unmountApp(tester, db);
  });

  testWidgets('carte d\'anomalie affichée puis fermée pour la journée', (
    tester,
  ) async {
    await tester.runAsync(() async {
      final transactions = DriftTransactionRepository(db);
      for (final day in [3, 8, 15]) {
        await transactions.add(
          expense(
            'hist-$day',
            1000,
            DateTime(2026, 10, 14 - day, 10),
            category: TransactionCategory.transport,
          ),
        );
      }
      await transactions.add(
        expense(
          'taxi',
          4000,
          DateTime(2026, 10, 14, 9),
          category: TransactionCategory.transport,
        ).copyWith(product: 'taxi'),
      );
    });
    await pumpNoodoApp(tester, db: db, now: now);

    final message = frenchL10n.unusualExpenseMessage(
      'taxi',
      4000,
      frenchL10n.categoryTransport,
      1000,
    );
    expect(find.text(message), findsOneWidget);
    expect(find.text(frenchL10n.unusualExpenseAdvice), findsOneWidget);

    await tester.tap(find.byTooltip(frenchL10n.dismissAlert));
    await tester.pumpAndSettle();

    expect(find.text(message), findsNothing);
    final dismissed = await tester.runAsync(
      () => db.select(db.dismissedAnomalies).get(),
    );
    expect(dismissed!.single.type, AnomalyType.unusualExpense);
    expect(dismissed.single.day, DateTime(2026, 10, 14));

    await unmountApp(tester, db);
  });

  testWidgets('photothèque : grille filtrée par créancier', (tester) async {
    await tester.runAsync(() async {
      final nodes = DriftNodeRepository(db);
      await nodes.addCreditor(
        const CreditorNode(
          id: 'awa',
          supplierName: 'Maman Awa',
          balanceDueFcfa: 0,
        ),
      );
      await nodes.addCreditor(
        const CreditorNode(
          id: 'amadou',
          supplierName: 'Monsieur Amadou',
          balanceDueFcfa: 0,
        ),
      );
      final photos = DriftPhotoRepository(db);
      for (final (id, creditor, day) in [
        ('p1', 'awa', 10),
        ('p2', 'awa', 12),
        ('p3', 'amadou', 13),
      ]) {
        await photos.add(
          ReceiptPhoto(
            id: id,
            fileName: '$id.jpg',
            creditorId: creditor,
            takenAt: DateTime(2026, 10, day, 9),
          ),
        );
      }
    });
    await pumpNoodoApp(
      tester,
      db: db,
      now: now,
      initialLocation: AppRoutes.receipts,
    );

    Finder thumbnails() => find.descendant(
      of: find.byType(ReceiptsScreen),
      matching: find.byType(PhotoThumbnail),
    );
    expect(thumbnails(), findsNWidgets(3));
    expect(
      find.bySemanticsLabel(
        frenchL10n.photoSemantics('Monsieur Amadou', '13 oct. 2026'),
      ),
      findsOneWidget,
    );

    await tester.tap(find.byTooltip(frenchL10n.filterByCreditor));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Maman Awa').last);
    await tester.pumpAndSettle();

    expect(thumbnails(), findsNWidgets(2));
    expect(
      find.bySemanticsLabel(
        frenchL10n.photoSemantics('Monsieur Amadou', '13 oct. 2026'),
      ),
      findsNothing,
    );

    await unmountApp(tester, db);
  });
}
