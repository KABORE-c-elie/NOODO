import 'package:drift/drift.dart';

@DataClassName('LocalUnitRow')
class LocalUnits extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().unique()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
