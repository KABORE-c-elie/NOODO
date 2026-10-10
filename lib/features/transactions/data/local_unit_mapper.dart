import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';

extension LocalUnitRowMapper on LocalUnitRow {
  LocalUnit toDomain() => LocalUnit(id: id, name: name, isCustom: isCustom);
}
