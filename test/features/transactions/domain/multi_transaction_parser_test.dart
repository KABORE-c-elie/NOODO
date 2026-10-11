import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/parser/transaction_parser.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

const _tas = LocalUnit(id: 'tas', name: 'tas');
const _botte = LocalUnit(id: 'botte', name: 'botte');
const _sachet = LocalUnit(id: 'sachet', name: 'sachet');
const _units = [_tas, _botte, _sachet];

void main() {
  const parser = TransactionParser();

  List<ParseResult> parse(String text) => parser.parseAll(text, _units);

  group('plusieurs opérations dans une phrase', () {
    test('vente au prix unitaire puis dépense', () {
      final results = parse(
        "j'ai vendu 2 tas de 1000 F et j'ai dépensé 3000 F pour le transport",
      );

      expect(results, hasLength(2));
      expect(results[0].type, TransactionType.sale);
      expect(results[0].quantity, 2);
      expect(results[0].unit, _tas);
      expect(results[0].statedPriceFcfa, 1000);
      expect(results[0].priceBasis, PriceBasis.perUnit);
      expect(results[0].amountFcfa, 2000);
      expect(results[1].type, TransactionType.expense);
      expect(results[1].amountFcfa, 3000);
      expect(results[1].category, TransactionCategory.transport);
    });

    test(
      'phrase réelle du téléphone : « 1000 francs » puis « 3000 francs »',
      () {
        final results = parse(
          "j'ai vendu deux tas de tomates à 1000 francs et j'ai dépensé 3000 "
          'francs au niveau 1 pour transport',
        );

        expect(results.map((r) => (r.type, r.amountFcfa)), [
          (TransactionType.sale, 1000),
          (TransactionType.expense, 3000),
        ]);
        expect(results[0].product, 'tomates');
        expect(results[1].category, TransactionCategory.transport);
      },
    );

    test('phrase réelle avec « 1000f » et « 3000f » collés', () {
      final results = parse(
        "j'ai vendu deux tas de tomates à 1000f et j'ai dépensé 3000f pour le "
        'transport',
      );

      expect(results.map((r) => (r.type, r.amountFcfa)), [
        (TransactionType.sale, 1000),
        (TransactionType.expense, 3000),
      ]);
    });

    test('« puis » sépare un achat et une vente', () {
      final results = parse(
        "j'ai acheté 2 sacs de riz à 10 000 F puis j'ai vendu 5 tas à 2500 F",
      );

      expect(results.map((r) => (r.type, r.amountFcfa)), [
        (TransactionType.expense, 10000),
        (TransactionType.sale, 2500),
      ]);
    });

    test('virgules : trois dépenses, le verbe est hérité', () {
      final results = parse(
        "j'ai payé 500 F de taxi, 1000 F de savon et 2000 F de riz",
      );

      expect(results.map((r) => (r.type, r.amountFcfa, r.category)), [
        (TransactionType.expense, 500, TransactionCategory.transport),
        (TransactionType.expense, 1000, TransactionCategory.supplies),
        (TransactionType.expense, 2000, TransactionCategory.cereals),
      ]);
    });
  });

  group('verbe hérité', () {
    test('« vendu 2 tas à 1000 et 3 bottes à 500 »', () {
      final results = parse(
        "j'ai vendu 2 tas de tomates à 1000 et 3 bottes d'oseille à 500",
      );

      expect(results, hasLength(2));
      expect(results[1].type, TransactionType.sale);
      expect(results[1].quantity, 3);
      expect(results[1].unit, _botte);
      expect(results[1].product, 'oseille');
      expect(results[1].amountFcfa, 500);
      expect(
        results[1].confidence,
        greaterThanOrEqualTo(lowConfidenceThreshold),
      );
    });

    test('un transport sans verbe n\'hérite pas d\'une vente : à vérifier', () {
      final results = parse(
        "j'ai vendu deux tas de tomates à 1000 francs et j'ai fait 3000 francs "
        'de transport',
      );

      expect(results, hasLength(2));
      expect(results[0].type, TransactionType.sale);
      expect(results[1].type, isNull);
      expect(results[1].amountFcfa, 3000);
      expect(results[1].confidence, lessThan(lowConfidenceThreshold));
    });
  });

  group('pas de découpage abusif', () {
    test('plusieurs produits pour un seul montant', () {
      final results = parse("j'ai vendu des tomates et des oignons à 3000 F");

      expect(results, hasLength(1));
      expect(results.single.amountFcfa, 3000);
      expect(results.single.type, TransactionType.sale);
    });

    test('liste de produits séparés par des virgules', () {
      final results = parse(
        "j'ai vendu des tomates, des oignons et du piment pour 3000 F",
      );

      expect(results, hasLength(1));
      expect(results.single.amountFcfa, 3000);
    });

    test('une phrase simple donne le même résultat que parse', () {
      const text = "J'ai vendu 2 tas de tomates à 1 000 francs";

      expect(parse(text), [parser.parse(text, _units)]);
    });

    test('« deux et demi » reste une quantité', () {
      final results = parse("j'ai vendu deux et demi sachets à 1000 F");

      expect(results, hasLength(1));
      expect(results.single.quantity, 2.5);
    });
  });

  group('prix unitaire ou total', () {
    test('« à 1000 F » : prix total par défaut', () {
      final result = parse("j'ai vendu 2 tas de tomates à 1000 F").single;

      expect(result.priceBasis, PriceBasis.total);
      expect(result.statedPriceFcfa, 1000);
      expect(result.amountFcfa, 1000);
    });

    test('« de 1000 F » juste après l\'unité : prix unitaire', () {
      final result = parse("j'ai vendu 3 sachets de 500 F").single;

      expect(result.priceBasis, PriceBasis.perUnit);
      expect(result.amountFcfa, 1500);
    });

    test('« chacun » après le prix', () {
      final result = parse("j'ai vendu 3 sachets de piment à 250 F chacun")
          .single;

      expect(result.priceBasis, PriceBasis.perUnit);
      expect(result.product, 'piment');
      expect(result.amountFcfa, 750);
    });

    test('« le tas » après le prix', () {
      final result = parse("j'ai vendu 2 tas à 1000 F le tas").single;

      expect(result.priceBasis, PriceBasis.perUnit);
      expect(result.amountFcfa, 2000);
    });

    test('« l\'unité » avec une unité inconnue', () {
      final result = parse("j'ai acheté 4 bidons d'huile à 1500 F l'unité")
          .single;

      expect(result.unknownUnitText, 'bidons');
      expect(result.priceBasis, PriceBasis.perUnit);
      expect(result.amountFcfa, 6000);
    });

    test('demi-unité au prix unitaire', () {
      final result = parse("j'ai vendu un demi sachet de 500 F").single;

      expect(result.quantity, 0.5);
      expect(result.amountFcfa, 250);
    });

    test('sans quantité, « chacun » ne change rien', () {
      final result = parse("j'ai payé 500 F chacun").single;

      expect(result.priceBasis, PriceBasis.total);
      expect(result.amountFcfa, 500);
    });
  });

  group('phrases réelles du TECNO (11 octobre)', () {
    test(
      '« 2 tas de tomates de 1000 francs » : prix unitaire après le produit',
      () {
        final results = parse(
          "j'ai vendu deux tas de tomates de 1000 francs et j'ai dépensé 5000 "
          'francs comme essence',
        );

        expect(results, hasLength(2));
        expect(results[0].type, TransactionType.sale);
        expect(results[0].product, 'tomates');
        expect(results[0].priceBasis, PriceBasis.perUnit);
        expect(results[0].amountFcfa, 2000);
        expect(results[1].type, TransactionType.expense);
        expect(results[1].amountFcfa, 5000);
        expect(results[1].category, TransactionCategory.transport);
      },
    );

    test("« j'ai mis de l'essence » : seconde carte à vérifier", () {
      final results = parse(
        "j'ai vendu du poulet parler à 2000 francs et j'ai mis de l'essence "
        '1500 francs comme transport',
      );

      expect(results, hasLength(2));
      expect(results[0].type, TransactionType.sale);
      expect(results[0].amountFcfa, 2000);
      expect(results[1].type, isNull);
      expect(results[1].amountFcfa, 1500);
      expect(results[1].category, TransactionCategory.transport);
      expect(results[1].confidence, lessThan(lowConfidenceThreshold));
    });

    test("« de 5 litres » sans devise n'est pas un prix unitaire", () {
      final result = parse("j'ai acheté 2 bidons d'huile de 5 litres").single;

      expect(result.priceBasis, PriceBasis.total);
    });
  });
}
