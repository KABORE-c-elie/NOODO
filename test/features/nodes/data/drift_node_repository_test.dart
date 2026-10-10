import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftNodeRepository repository;

  final awa = CreditorNode(
    id: 'awa',
    supplierName: 'Maman Awa',
    phone: '+226 70 00 11 22',
    balanceDueFcfa: 7500,
    dueDate: DateTime(2026, 10, 20),
  );
  const amadou = CreditorNode(
    id: 'amadou',
    supplierName: 'Monsieur Amadou',
    balanceDueFcfa: 2000,
  );

  setUp(() {
    db = createMemoryDatabase();
    repository = DriftNodeRepository(db);
  });

  tearDown(() => db.close());

  group('nœuds créanciers', () {
    test('ajout et recherche', () async {
      await repository.addCreditor(awa);

      expect(await repository.findCreditor('awa'), awa);
      expect(await repository.findCreditor('inconnu'), isNull);
    });

    test('liste triée par échéance, sans échéance en dernier', () async {
      await repository.addCreditor(amadou);
      await repository.addCreditor(awa);

      expect(await repository.listCreditors(), [awa, amadou]);
    });

    test('modification du solde dû', () async {
      await repository.addCreditor(awa);

      await repository.updateCreditor(awa.copyWith(balanceDueFcfa: 2500));

      expect((await repository.findCreditor('awa'))!.balanceDueFcfa, 2500);
    });

    test('modification d\'un nœud absent', () {
      expect(() => repository.updateCreditor(amadou), throwsStateError);
    });

    test('suppression', () async {
      await repository.addCreditor(awa);

      await repository.deleteCreditor('awa');

      expect(await repository.listCreditors(), isEmpty);
    });

    test('solde dû négatif refusé par la base', () {
      expect(
        () => repository.addCreditor(awa.copyWith(balanceDueFcfa: -1)),
        throwsA(anything),
      );
    });
  });

  group('nœud impôts', () {
    test('créé avec les valeurs initiales à la première lecture', () async {
      expect(await repository.getTaxNode(), TaxNode.initial());
    });

    test('mise à jour du taux et du solde épargné', () async {
      final initial = await repository.getTaxNode();

      await repository.updateTaxNode(
        initial.copyWith(rateBasisPoints: 300, savedBalanceFcfa: 1250),
      );

      final updated = await repository.getTaxNode();
      expect(updated.rateBasisPoints, 300);
      expect(updated.savedBalanceFcfa, 1250);
    });
  });
}
