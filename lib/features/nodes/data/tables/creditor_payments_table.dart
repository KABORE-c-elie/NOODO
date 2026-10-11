import 'package:drift/drift.dart';
import 'package:noodo/features/nodes/data/tables/creditor_nodes_table.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/transactions/data/tables/transactions_table.dart';

@DataClassName('CreditorPaymentRow')
class CreditorPayments extends Table {
  TextColumn get id => text()();
  TextColumn get creditorId =>
      text().references(CreditorNodes, #id, onDelete: KeyAction.cascade)();
  TextColumn get transactionId => text().nullable().references(
    Transactions,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get receiptNumber => text().unique()();
  IntColumn get amountFcfa => integer()();
  TextColumn get method => textEnum<PaymentMethod>()();
  TextColumn get reason => text().nullable()();
  DateTimeColumn get date => dateTime()();
  IntColumn get remainingAfterFcfa => integer()();
  TextColumn get creditorName => text()();
  TextColumn get creditorPhone => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (amount_fcfa > 0)',
    'CHECK (remaining_after_fcfa >= 0)',
  ];
}
