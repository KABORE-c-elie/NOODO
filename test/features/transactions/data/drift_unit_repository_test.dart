import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/transactions/data/drift_unit_repository.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftUnitRepository repository;

  setUp(() {
    db = createMemoryDatabase();
    repository = DriftUnitRepository(db);
  });

  tearDown(() => db.close());

  test('les unités du référentiel sont pré-remplies', () async {
    final units = await repository.listAll();

    expect(
      units.map((u) => u.name),
      containsAll(['tas', 'botte', 'boîte', 'sachet', 'bol', 'yoruba']),
    );
    expect(units.every((u) => !u.isCustom), isTrue);
  });

  test(
    'ajout d\'une unité personnalisée, listée après le référentiel',
    () async {
      final added = await repository.addCustom('  Bidon ');

      expect(
        added,
        const LocalUnit(id: 'bidon', name: 'bidon', isCustom: true),
      );
      expect((await repository.listAll()).last, added);
    },
  );

  test('ajouter une unité existante la renvoie sans doublon', () async {
    final before = (await repository.listAll()).length;

    final unit = await repository.addCustom('Tas');

    expect(unit.isCustom, isFalse);
    expect((await repository.listAll()).length, before);
  });

  test('nom vide refusé', () {
    expect(() => repository.addCustom('   '), throwsArgumentError);
  });
}
