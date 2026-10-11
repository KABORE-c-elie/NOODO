import 'package:drift/drift.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';

final class DriftSettingsRepository implements SettingsRepository {
  const DriftSettingsRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<AppSettings> watch() =>
      _select().watchSingleOrNull().map(_toDomain).distinct();

  @override
  Future<AppSettings> get() => _select().getSingleOrNull().then(_toDomain);

  @override
  Future<void> setLanguage(String languageCode) {
    if (!supportedLanguageCodes.contains(languageCode)) {
      throw ArgumentError.value(languageCode, 'languageCode');
    }
    return _write(AppSettingsTableCompanion(languageCode: Value(languageCode)));
  }

  @override
  Future<void> setAlertSensitivity(AlertSensitivity sensitivity) =>
      _write(AppSettingsTableCompanion(alertSensitivity: Value(sensitivity)));

  SimpleSelectStatement<$AppSettingsTableTable, AppSettingsRow> _select() =>
      _db.select(_db.appSettingsTable)
        ..where((s) => s.id.equals(AppDatabase.settingsRowId));

  Future<void> _write(AppSettingsTableCompanion changes) => (_db.update(
    _db.appSettingsTable,
  )..where((s) => s.id.equals(AppDatabase.settingsRowId))).write(changes);

  AppSettings _toDomain(AppSettingsRow? row) => row == null
      ? const AppSettings()
      : AppSettings(
          languageCode: row.languageCode,
          alertSensitivity: row.alertSensitivity,
        );
}
