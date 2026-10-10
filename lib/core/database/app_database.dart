import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:noodo/features/nodes/data/tables/creditor_nodes_table.dart';
import 'package:noodo/features/nodes/data/tables/tax_nodes_table.dart';
import 'package:noodo/features/transactions/data/tables/local_units_table.dart';
import 'package:noodo/features/transactions/data/tables/transactions_table.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'app_database.g.dart';

const _builtInUnits = ['tas', 'botte', 'boîte', 'sachet', 'bol', 'yoruba'];

@DriftDatabase(tables: [Transactions, LocalUnits, CreditorNodes, TaxNodes])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'noodo'));

  @override
  int get schemaVersion => 1;

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
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
