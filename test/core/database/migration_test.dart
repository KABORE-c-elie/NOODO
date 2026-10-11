import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/features/transactions/data/drift_transaction_repository.dart';

import '../../helpers/fixtures.dart';

const _schemaV1 = [
  'CREATE TABLE "local_units" ("id" TEXT NOT NULL, "name" TEXT NOT NULL UNIQUE, "is_custom" INTEGER NOT NULL DEFAULT 0 CHECK ("is_custom" IN (0, 1)), PRIMARY KEY ("id"))',
  'CREATE TABLE "transactions" ("id" TEXT NOT NULL, "type" TEXT NOT NULL, "amount_fcfa" INTEGER NOT NULL, "quantity" REAL NULL, "unit_id" TEXT NULL REFERENCES local_units (id), "product" TEXT NULL, "category" TEXT NOT NULL DEFAULT \'other\', "raw_text" TEXT NOT NULL, "date" INTEGER NOT NULL, PRIMARY KEY ("id"), CHECK (amount_fcfa >= 0))',
  'CREATE TABLE "creditor_nodes" ("id" TEXT NOT NULL, "supplier_name" TEXT NOT NULL, "phone" TEXT NULL, "balance_due_fcfa" INTEGER NOT NULL, "due_date" INTEGER NULL, PRIMARY KEY ("id"), CHECK (balance_due_fcfa >= 0))',
  'CREATE TABLE "tax_nodes" ("id" TEXT NOT NULL, "rate_basis_points" INTEGER NOT NULL, "saved_balance_fcfa" INTEGER NOT NULL DEFAULT 0, PRIMARY KEY ("id"), CHECK (rate_basis_points BETWEEN 0 AND 10000), CHECK (saved_balance_fcfa >= 0))',
  "INSERT INTO local_units (id, name) VALUES ('tas', 'tas')",
  "INSERT INTO transactions (id, type, amount_fcfa, unit_id, category, raw_text, date) VALUES ('ancienne', 'sale', 1000, 'tas', 'vegetables', 'vente v1', 1791900000)",
  "INSERT INTO creditor_nodes (id, supplier_name, balance_due_fcfa) VALUES ('awa', 'Maman Awa', 5000)",
  "INSERT INTO tax_nodes (id, rate_basis_points, saved_balance_fcfa) VALUES ('tax', 300, 120)",
  'PRAGMA user_version = 1',
];

void main() {
  test('une base v1 existante passe en v3 sans perte de données', () async {
    final db = AppDatabase(
      NativeDatabase.memory(
        setup: (raw) {
          for (final statement in _schemaV1) {
            raw.execute(statement);
          }
        },
      ),
    );
    addTearDown(db.close);
    final transactions = DriftTransactionRepository(db);
    final nodes = DriftNodeRepository(db);

    final old = await transactions.findById('ancienne');
    expect(old?.amountFcfa, 1000);
    expect(old?.unit?.id, 'tas');

    final taxNode = await nodes.getTaxNode();
    expect(taxNode.rateBasisPoints, 300);
    expect(taxNode.savedBalanceFcfa, 120);
    expect(taxNode.nextDueDate, isNull);

    await transactions.delete('ancienne');
    expect((await nodes.getTaxNode()).savedBalanceFcfa, 120);

    await transactions.add(sale('nouvelle', 1000, DateTime(2026, 10, 14)));
    expect((await nodes.getTaxNode()).savedBalanceFcfa, 150);

    final payment = await nodes.recordPayment(
      PaymentRequest(
        paymentId: 'p1',
        transactionId: 'tx-p1',
        creditorId: 'awa',
        amountFcfa: 2000,
        method: PaymentMethod.cash,
        date: DateTime(2026, 10, 14),
        expenseText: 'Paiement à Maman Awa',
      ),
    );
    expect(payment.receiptNumber, 'Rec-2026-0001');
    expect((await nodes.findCreditor('awa'))!.balanceDueFcfa, 3000);

    expect(await DriftSettingsRepository(db).get(), const AppSettings());
    expect(await db.select(db.receiptPhotos).get(), isEmpty);
    expect(await db.select(db.dismissedAnomalies).get(), isEmpty);
    expect((await transactions.findById('tx-p1'))!.paymentCreditorId, 'awa');

    final version = await db.customSelect('PRAGMA user_version').getSingle();
    expect(version.read<int>('user_version'), db.schemaVersion);
  });
}
