import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/data/local_unit_mapper.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/unit_repository.dart';

final class DriftUnitRepository implements UnitRepository {
  const DriftUnitRepository(this._db);

  final AppDatabase _db;

  @override
  Future<List<LocalUnit>> listAll() async {
    final rows =
        await (_db.select(_db.localUnits)..orderBy([
              (u) => OrderingTerm.asc(u.isCustom),
              (u) => OrderingTerm.asc(u.name),
            ]))
            .get();
    return rows.map((row) => row.toDomain()).toList();
  }

  @override
  Future<LocalUnit> addCustom(String name) async {
    final normalized = name.trim().toLowerCase();
    if (normalized.isEmpty) {
      throw ArgumentError.value(name, 'name', 'ne peut pas être vide');
    }

    final existing = await (_db.select(
      _db.localUnits,
    )..where((u) => u.id.equals(normalized))).getSingleOrNull();
    if (existing != null) return existing.toDomain();

    await _db
        .into(_db.localUnits)
        .insert(
          LocalUnitsCompanion.insert(
            id: normalized,
            name: normalized,
            isCustom: const Value(true),
          ),
        );
    return LocalUnit(id: normalized, name: normalized, isCustom: true);
  }
}
