import 'package:noodo/features/transactions/domain/local_unit.dart';

abstract interface class UnitRepository {
  Future<List<LocalUnit>> listAll();

  Future<LocalUnit> addCustom(String name);
}
