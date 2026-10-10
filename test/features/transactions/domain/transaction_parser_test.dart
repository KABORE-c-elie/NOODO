import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/category_lexicon.dart';
import 'package:noodo/features/transactions/domain/parser/transaction_parser.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

const _tas = LocalUnit(id: 'tas', name: 'tas');
const _botte = LocalUnit(id: 'botte', name: 'botte');
const _boite = LocalUnit(id: 'boîte', name: 'boîte');
const _sachet = LocalUnit(id: 'sachet', name: 'sachet');
const _units = [_tas, _botte, _boite, _sachet];

void main() {
  const parser = TransactionParser();

  group('cas normaux', () {
    test('vente complète avec unité, produit et montant', () {
      final result = parser.parse(
        "J'ai vendu 2 tas de tomates à 1 000 francs",
        _units,
      );

      expect(result.type, TransactionType.sale);
      expect(result.amountFcfa, 1000);
      expect(result.quantity, 2);
      expect(result.unit, _tas);
      expect(result.unknownUnitText, isNull);
      expect(result.product, 'tomates');
      expect(result.category, TransactionCategory.vegetables);
      expect(result.confidence, greaterThanOrEqualTo(0.9));
    });

    test('dépense de transport sans quantité', () {
      final result = parser.parse("J'ai payé 3 000 FCFA de transport", _units);

      expect(result.type, TransactionType.expense);
      expect(result.amountFcfa, 3000);
      expect(result.quantity, isNull);
      expect(result.unit, isNull);
      expect(result.product, 'transport');
      expect(result.category, TransactionCategory.transport);
      expect(result.confidence, greaterThanOrEqualTo(0.9));
    });

    test('achat de céréales avec unité inconnue', () {
      final result = parser.parse(
        "J'ai acheté un sac de riz à 1.000 F",
        _units,
      );

      expect(result.type, TransactionType.expense);
      expect(result.amountFcfa, 1000);
      expect(result.quantity, 1);
      expect(result.unit, isNull);
      expect(result.unknownUnitText, 'sac');
      expect(result.product, 'riz');
      expect(result.category, TransactionCategory.cereals);
      expect(result.confidence, greaterThanOrEqualTo(0.6));
    });
  });

  group('verbes', () {
    final cases = {
      'vendu': TransactionType.sale,
      'encaissé': TransactionType.sale,
      'reçu': TransactionType.sale,
      'payé': TransactionType.expense,
      'acheté': TransactionType.expense,
      'dépensé': TransactionType.expense,
      'donné': TransactionType.expense,
    };

    for (final entry in cases.entries) {
      test('« ${entry.key} » donne ${entry.value.name}', () {
        final result = parser.parse("J'ai ${entry.key} 500 F", _units);

        expect(result.type, entry.value);
      });
    }
  });

  group('variantes d\'écriture des montants', () {
    final cases = {
      '1000 francs': 1000,
      '1 000 F': 1000,
      '1.000 CFA': 1000,
      '1500CFA': 1500,
      '2 500 fcfa': 2500,
      '10 000 F': 10000,
      'cent francs': 100,
      'deux cents francs': 200,
      'cinq cents francs': 500,
      'mille francs': 1000,
      'deux mille francs': 2000,
      'cinq mille F': 5000,
      'dix mille FCFA': 10000,
      'deux mille cinq cents francs': 2500,
    };

    for (final entry in cases.entries) {
      test('« ${entry.key} » vaut ${entry.value}', () {
        final result = parser.parse("J'ai vendu pour ${entry.key}", _units);

        expect(result.amountFcfa, entry.value);
      });
    }
  });

  group('quantités et unités', () {
    test('quantité en lettres et unité au pluriel', () {
      final result = parser.parse(
        "J'ai vendu deux sachets de piment à cinq cents francs",
        _units,
      );

      expect(result.quantity, 2);
      expect(result.unit, _sachet);
      expect(result.product, 'piment');
      expect(result.amountFcfa, 500);
    });

    test('pluriel avec accent et élision', () {
      final result = parser.parse(
        "Encaissé 1500CFA pour 3 bottes d'oseille",
        _units,
      );

      expect(result.type, TransactionType.sale);
      expect(result.quantity, 3);
      expect(result.unit, _botte);
      expect(result.product, 'oseille');
      expect(result.category, TransactionCategory.vegetables);
    });

    test('pluriel d\'une unité accentuée', () {
      final result = parser.parse(
        "J'ai vendu trois boîtes de maïs à 1 200 F",
        _units,
      );

      expect(result.quantity, 3);
      expect(result.unit, _boite);
      expect(result.product, 'maïs');
      expect(result.category, TransactionCategory.cereals);
    });

    test('« un demi » vaut 0.5', () {
      final result = parser.parse(
        "J'ai vendu un demi sachet de gombo à 250 F",
        _units,
      );

      expect(result.quantity, 0.5);
      expect(result.unit, _sachet);
      expect(result.product, 'gombo');
      expect(result.amountFcfa, 250);
    });

    test('« la moitié d\'un » vaut 0.5', () {
      final result = parser.parse(
        "J'ai vendu la moitié d'un tas d'oignons pour 500 francs",
        _units,
      );

      expect(result.quantity, 0.5);
      expect(result.unit, _tas);
      expect(result.product, 'oignons');
    });

    test('unité inconnue au pluriel conservée telle quelle', () {
      final result = parser.parse(
        "J'ai acheté 2 bidons d'huile à 4 000 F",
        _units,
      );

      expect(result.quantity, 2);
      expect(result.unit, isNull);
      expect(result.unknownUnitText, 'bidons');
      expect(result.product, 'huile');
      expect(result.category, TransactionCategory.other);
    });

    test('quantité sans unité', () {
      final result = parser.parse("J'ai vendu 3 mangues à 600 F", _units);

      expect(result.quantity, 3);
      expect(result.unit, isNull);
      expect(result.unknownUnitText, isNull);
      expect(result.product, 'mangues');
      expect(result.amountFcfa, 600);
    });
  });

  group('transcriptions imparfaites', () {
    test('sans accents ni apostrophes', () {
      final result = parser.parse('jai depense 500f taxi', _units);

      expect(result.type, TransactionType.expense);
      expect(result.amountFcfa, 500);
      expect(result.category, TransactionCategory.transport);
    });

    test('montant sans devise après la quantité', () {
      final result = parser.parse("J'ai vendu 2 tas de tomates à 1000", _units);

      expect(result.quantity, 2);
      expect(result.amountFcfa, 1000);
      expect(result.confidence, greaterThanOrEqualTo(0.6));
    });

    test('montant sans devise collé à un nom', () {
      final result = parser.parse("J'ai payé 500 transport", _units);

      expect(result.amountFcfa, 500);
      expect(result.quantity, isNull);
      expect(result.category, TransactionCategory.transport);
    });
  });

  group('phrases ambiguës', () {
    test('type absent : confiance basse', () {
      final result = parser.parse('2 tas de tomates 1000 francs', _units);

      expect(result.type, isNull);
      expect(result.amountFcfa, 1000);
      expect(result.confidence, lessThan(0.6));
    });

    test('montant absent : confiance basse', () {
      final result = parser.parse("J'ai vendu 3 mangues", _units);

      expect(result.type, TransactionType.sale);
      expect(result.amountFcfa, isNull);
      expect(result.quantity, 3);
      expect(result.confidence, lessThan(0.6));
    });

    test('verbes de vente et de dépense mélangés : type indéterminé', () {
      final result = parser.parse(
        "J'ai acheté des tomates et vendu des oignons pour 2000 F",
        _units,
      );

      expect(result.type, isNull);
      expect(result.confidence, lessThan(0.6));
    });

    test('« une dépense » n\'est pas une quantité', () {
      final result = parser.parse(
        "J'ai fait une dépense de 2 000 F pour l'essence",
        _units,
      );

      expect(result.type, TransactionType.expense);
      expect(result.quantity, isNull);
      expect(result.amountFcfa, 2000);
      expect(result.category, TransactionCategory.transport);
    });

    test('texte vide', () {
      final result = parser.parse('   ', _units);

      expect(result.type, isNull);
      expect(result.amountFcfa, isNull);
      expect(result.category, TransactionCategory.other);
      expect(result.confidence, 0);
    });
  });

  group('lexique extensible', () {
    test('un lexique personnalisé ajoute des mots-clés', () {
      final custom = TransactionParser(
        lexicon: CategoryLexicon.standard.withKeywords(
          TransactionCategory.vegetables,
          ['bissap'],
        ),
      );

      final result = custom.parse("J'ai vendu 2 tas de bissap à 500 F", _units);

      expect(result.category, TransactionCategory.vegetables);
    });
  });
}
