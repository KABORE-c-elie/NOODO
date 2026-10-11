import 'package:drift/drift.dart';

@DataClassName('TaxNodeRow')
class TaxNodes extends Table {
  TextColumn get id => text()();
  IntColumn get rateBasisPoints => integer()();
  IntColumn get savedBalanceFcfa => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextDueDate => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (rate_basis_points BETWEEN 0 AND 10000)',
    'CHECK (saved_balance_fcfa >= 0)',
  ];
}
