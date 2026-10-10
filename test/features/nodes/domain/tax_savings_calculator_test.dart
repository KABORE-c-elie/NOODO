import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/nodes/domain/tax_savings_calculator.dart';

void main() {
  const calculator = TaxSavingsCalculator();

  int savings(int sale, int rate) =>
      calculator.savingsFor(saleAmountFcfa: sale, rateBasisPoints: rate);

  test('5 % de 1 000 FCFA font 50 FCFA', () {
    expect(savings(1000, 500), 50);
  });

  test('arrondi à l\'entier inférieur', () {
    expect(savings(999, 500), 49);
    expect(savings(1050, 250), 26);
    expect(savings(19, 500), 0);
  });

  test('taux nul ou vente nulle : rien à mettre de côté', () {
    expect(savings(1000, 0), 0);
    expect(savings(0, 500), 0);
  });

  test('taux de 100 %', () {
    expect(savings(1234, 10000), 1234);
  });

  test('entrées invalides refusées', () {
    expect(() => savings(-1, 500), throwsArgumentError);
    expect(() => savings(1000, -1), throwsRangeError);
    expect(() => savings(1000, 10001), throwsRangeError);
  });
}
