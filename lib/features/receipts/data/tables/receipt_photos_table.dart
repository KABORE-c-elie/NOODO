import 'package:drift/drift.dart';
import 'package:noodo/features/nodes/data/tables/creditor_nodes_table.dart';
import 'package:noodo/features/nodes/data/tables/creditor_payments_table.dart';
import 'package:noodo/features/transactions/data/tables/transactions_table.dart';

@DataClassName('ReceiptPhotoRow')
class ReceiptPhotos extends Table {
  TextColumn get id => text()();
  TextColumn get fileName => text()();
  TextColumn get creditorId => text().nullable().references(
    CreditorNodes,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get transactionId => text().nullable().references(
    Transactions,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get paymentId => text().nullable().references(
    CreditorPayments,
    #id,
    onDelete: KeyAction.setNull,
  )();
  DateTimeColumn get takenAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
