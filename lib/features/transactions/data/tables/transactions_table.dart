import 'package:drift/drift.dart';
import 'package:noodo/features/transactions/data/tables/local_units_table.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

@DataClassName('TransactionRow')
class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get type => textEnum<TransactionType>()();
  IntColumn get amountFcfa => integer()();
  RealColumn get quantity => real().nullable()();
  TextColumn get unitId => text().nullable().references(LocalUnits, #id)();
  TextColumn get product => text().nullable()();
  TextColumn get category => textEnum<TransactionCategory>().withDefault(
    Constant(TransactionCategory.other.name),
  )();
  TextColumn get rawText => text()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['CHECK (amount_fcfa >= 0)'];
}
