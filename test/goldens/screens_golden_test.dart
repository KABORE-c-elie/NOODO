@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';

import '../helpers/fixtures.dart';
import '../helpers/golden_fonts.dart';
import '../helpers/pump_app.dart';

void main() {
  late AppDatabase db;
  final now = DateTime(2026, 10, 14, 15);

  setUpAll(loadAppFonts);
  setUp(() => db = createMemoryDatabase());

  Future<void> seed(WidgetTester tester, AppThemeMode mode) =>
      tester.runAsync(() async {
        await DriftSettingsRepository(db).setThemeMode(mode);
        final transactions = DriftTransactionRepository(db);
        await transactions.add(
          sale(
            'tomates',
            15000,
            DateTime(2026, 10, 14, 9),
            category: TransactionCategory.vegetables,
          ).copyWith(product: 'tomates'),
        );
        await transactions.add(
          expense(
            'taxi',
            2500,
            DateTime(2026, 10, 14, 11),
            category: TransactionCategory.transport,
          ).copyWith(product: 'taxi'),
        );
        await transactions.add(sale('hier', 10000, DateTime(2026, 10, 13, 10)));
      });

  for (final (name, mode) in [
    ('clair', AppThemeMode.light),
    ('sombre', AppThemeMode.dark),
  ]) {
    testWidgets('Accueil, thème $name', (tester) async {
      await seed(tester, mode);
      await pumpNoodoApp(tester, db: db, now: now);

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('home_${mode.name}.png'),
      );

      await unmountApp(tester, db);
    });

    testWidgets('Confirmation à plusieurs cartes, thème $name', (tester) async {
      await seed(tester, mode);
      await pumpNoodoApp(
        tester,
        db: db,
        now: now,
        initialLocation: AppRoutes.confirmationPath(
          "j'ai vendu 2 tas de 1000 F et j'ai dépensé 3000 F pour le transport",
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('confirmation_${mode.name}.png'),
      );

      await unmountApp(tester, db);
    });
  }
}
