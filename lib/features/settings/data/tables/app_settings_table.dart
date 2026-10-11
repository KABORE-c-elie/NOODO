import 'package:drift/drift.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';

@DataClassName('AppSettingsRow')
class AppSettingsTable extends Table {
  @override
  String get tableName => 'app_settings';

  IntColumn get id => integer()();
  TextColumn get languageCode =>
      text().withDefault(const Constant(defaultLanguageCode))();
  TextColumn get alertSensitivity => textEnum<AlertSensitivity>().withDefault(
    Constant(AlertSensitivity.normal.name),
  )();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
