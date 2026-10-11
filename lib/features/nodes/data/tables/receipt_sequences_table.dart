import 'package:drift/drift.dart';

@DataClassName('ReceiptSequenceRow')
class ReceiptSequences extends Table {
  IntColumn get year => integer()();
  IntColumn get lastNumber => integer()();

  @override
  Set<Column<Object>> get primaryKey => {year};
}
