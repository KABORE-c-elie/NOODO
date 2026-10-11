import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';

final class DriftAnomalyDismissals implements AnomalyDismissals {
  const DriftAnomalyDismissals(this._db);

  final AppDatabase _db;

  @override
  Stream<Set<AnomalyType>> watchDismissed(DateTime day) =>
      (_db.select(_db.dismissedAnomalies)..where((d) => d.day.equals(day)))
          .watch()
          .map((rows) => {for (final row in rows) row.type});

  @override
  Future<void> dismiss(AnomalyType type, DateTime day) => _db
      .into(_db.dismissedAnomalies)
      .insert(
        DismissedAnomaliesCompanion.insert(type: type, day: day),
        mode: InsertMode.insertOrIgnore,
      );
}
