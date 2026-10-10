import 'package:drift/drift.dart';

@DataClassName('CreditorNodeRow')
class CreditorNodes extends Table {
  TextColumn get id => text()();
  TextColumn get supplierName => text()();
  TextColumn get phone => text().nullable()();
  IntColumn get balanceDueFcfa => integer()();
  DateTimeColumn get dueDate => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['CHECK (balance_due_fcfa >= 0)'];
}
