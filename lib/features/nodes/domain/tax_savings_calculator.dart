const _basisPointsPerUnit = 10000;

final class TaxSavingsCalculator {
  const TaxSavingsCalculator();

  int savingsFor({required int saleAmountFcfa, required int rateBasisPoints}) {
    if (saleAmountFcfa < 0) {
      throw ArgumentError.value(saleAmountFcfa, 'saleAmountFcfa');
    }
    if (rateBasisPoints < 0 || rateBasisPoints > _basisPointsPerUnit) {
      throw RangeError.range(
        rateBasisPoints,
        0,
        _basisPointsPerUnit,
        'rateBasisPoints',
      );
    }
    return saleAmountFcfa * rateBasisPoints ~/ _basisPointsPerUnit;
  }
}
