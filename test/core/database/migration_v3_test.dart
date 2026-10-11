import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';

const _schemaV3 = [
  'CREATE TABLE "local_units" ("id" TEXT NOT NULL, "name" TEXT NOT NULL UNIQUE, "is_custom" INTEGER NOT NULL DEFAULT 0 CHECK ("is_custom" IN (0, 1)), PRIMARY KEY ("id"))',
  'CREATE TABLE "transactions" ("id" TEXT NOT NULL, "type" TEXT NOT NULL, "amount_fcfa" INTEGER NOT NULL, "quantity" REAL NULL, "unit_id" TEXT NULL REFERENCES local_units (id), "product" TEXT NULL, "category" TEXT NOT NULL DEFAULT \'other\', "raw_text" TEXT NOT NULL, "date" INTEGER NOT NULL, "tax_saved_fcfa" INTEGER NOT NULL DEFAULT 0, PRIMARY KEY ("id"), CHECK (amount_fcfa >= 0))',
  'CREATE TABLE "creditor_nodes" ("id" TEXT NOT NULL, "supplier_name" TEXT NOT NULL, "phone" TEXT NULL, "balance_due_fcfa" INTEGER NOT NULL, "due_date" INTEGER NULL, PRIMARY KEY ("id"), CHECK (balance_due_fcfa >= 0))',
  'CREATE TABLE "tax_nodes" ("id" TEXT NOT NULL, "rate_basis_points" INTEGER NOT NULL, "saved_balance_fcfa" INTEGER NOT NULL DEFAULT 0, "next_due_date" INTEGER NULL, PRIMARY KEY ("id"), CHECK (rate_basis_points BETWEEN 0 AND 10000), CHECK (saved_balance_fcfa >= 0))',
  'CREATE TABLE "creditor_payments" ("id" TEXT NOT NULL, "creditor_id" TEXT NOT NULL REFERENCES creditor_nodes (id) ON DELETE CASCADE, "transaction_id" TEXT NULL REFERENCES transactions (id) ON DELETE SET NULL, "receipt_number" TEXT NOT NULL UNIQUE, "amount_fcfa" INTEGER NOT NULL, "method" TEXT NOT NULL, "reason" TEXT NULL, "date" INTEGER NOT NULL, "remaining_after_fcfa" INTEGER NOT NULL, "creditor_name" TEXT NOT NULL, "creditor_phone" TEXT NULL, PRIMARY KEY ("id"), CHECK (amount_fcfa > 0), CHECK (remaining_after_fcfa >= 0))',
  'CREATE TABLE "receipt_sequences" ("year" INTEGER NOT NULL, "last_number" INTEGER NOT NULL, PRIMARY KEY ("year"))',
  'CREATE TABLE "app_settings" ("id" INTEGER NOT NULL, "language_code" TEXT NOT NULL DEFAULT \'fr\', "alert_sensitivity" TEXT NOT NULL DEFAULT \'normal\', PRIMARY KEY ("id"))',
  'CREATE TABLE "receipt_photos" ("id" TEXT NOT NULL, "file_name" TEXT NOT NULL, "creditor_id" TEXT NULL REFERENCES creditor_nodes (id) ON DELETE SET NULL, "transaction_id" TEXT NULL REFERENCES transactions (id) ON DELETE SET NULL, "payment_id" TEXT NULL REFERENCES creditor_payments (id) ON DELETE SET NULL, "taken_at" INTEGER NOT NULL, PRIMARY KEY ("id"))',
  'CREATE TABLE "dismissed_anomalies" ("type" TEXT NOT NULL, "day" INTEGER NOT NULL, PRIMARY KEY ("type", "day"))',
  "INSERT INTO app_settings (id, language_code, alert_sensitivity) VALUES (1, 'en', 'high')",
  "INSERT INTO tax_nodes (id, rate_basis_points, saved_balance_fcfa) VALUES ('tax', 500, 0)",
  "INSERT INTO transactions (id, type, amount_fcfa, product, category, raw_text, date) VALUES ('t1', 'sale', 2000, 'essence', 'transport', 'vendu essence', 1791933086)",
  'PRAGMA user_version = 3',
];

void main() {
  test(
    'une base v3 (celle du téléphone) passe en v4 en gardant ses réglages',
    () async {
      final db = AppDatabase(
        NativeDatabase.memory(
          setup: (raw) {
            for (final statement in _schemaV3) {
              raw.execute(statement);
            }
          },
        ),
      );
      addTearDown(db.close);

      expect(
        await DriftSettingsRepository(db).get(),
        const AppSettings(
          languageCode: 'en',
          alertSensitivity: AlertSensitivity.high,
        ),
      );
      await DriftSettingsRepository(db).setThemeMode(AppThemeMode.dark);
      expect(
        (await DriftSettingsRepository(db).get()).themeMode,
        AppThemeMode.dark,
      );
      expect(
        (await DriftTransactionRepository(db).findById('t1'))!.amountFcfa,
        2000,
      );
      final version = await db.customSelect('PRAGMA user_version').getSingle();
      expect(version.read<int>('user_version'), 4);
    },
  );
}
