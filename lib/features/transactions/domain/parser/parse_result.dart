import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'parse_result.freezed.dart';

const lowConfidenceThreshold = 0.6;

enum PriceBasis { total, perUnit }

@freezed
abstract class ParseResult with _$ParseResult {
  const factory ParseResult({
    TransactionType? type,
    int? amountFcfa,
    double? quantity,
    LocalUnit? unit,
    String? unknownUnitText,
    String? product,
    @Default(TransactionCategory.other) TransactionCategory category,
    required double confidence,
    int? statedPriceFcfa,
    @Default(PriceBasis.total) PriceBasis priceBasis,
  }) = _ParseResult;
}
