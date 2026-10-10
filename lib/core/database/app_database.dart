import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:noodo/features/nodes/data/tables/creditor_nodes_table.dart';
import 'package:noodo/features/nodes/data/tables/creditor_payments_table.dart';
import 'package:noodo/features/nodes/data/tables/receipt_sequences_table.dart';
import 'package:noodo/features/nodes/data/tables/tax_nodes_table.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';
import 'package:noodo/features/transactions/data/tables/local_units_table.dart';
import 'package:noodo/features/transactions/data/tables/transactions_table.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'app_database.g.dart';

const _builtInUnits = ['tas', 'botte', 'boîte', 'sachet', 'bol', 'yoruba'];

@DriftDatabase(
  tables: [
    Transactions,
    LocalUnits,
    CreditorNodes,
    TaxNodes,
    CreditorPayments,
    ReceiptSequences,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'noodo'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await batch((b) {
        b.insertAll(
          localUnits,
          _builtInUnits.map(
            (name) => LocalUnitsCompanion.insert(id: name, name: name),
          ),
        );
      });
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(transactions, transactions.taxSavedFcfa);
        await m.addColumn(taxNodes, taxNodes.nextDueDate);
        await m.createTable(creditorPayments);
        await m.createTable(receiptSequences);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      final initial = TaxNode.initial();
      await into(taxNodes).insert(
        TaxNodesCompanion.insert(
          id: initial.id,
          rateBasisPoints: initial.rateBasisPoints,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    },
  );
}
