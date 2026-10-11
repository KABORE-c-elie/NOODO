import 'package:drift/drift.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';

@DataClassName('DismissedAnomalyRow')
class DismissedAnomalies extends Table {
  TextColumn get type => textEnum<AnomalyType>()();
  DateTimeColumn get day => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {type, day};
}
