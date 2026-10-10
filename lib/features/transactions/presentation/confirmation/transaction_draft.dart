import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'transaction_draft.freezed.dart';

@freezed
abstract class TransactionDraft with _$TransactionDraft {
  const TransactionDraft._();

  const factory TransactionDraft({
    @Default('') String rawText,
    TransactionType? type,
    int? amountFcfa,
    double? quantity,
    LocalUnit? unit,
    String? unknownUnitText,
    String? product,
    @Default(TransactionCategory.other) TransactionCategory category,
    @Default(1.0) double confidence,
    @Default(0) int revision,
  }) = _TransactionDraft;

  factory TransactionDraft.fromParse(
    String rawText,
    ParseResult result, {
    required int revision,
  }) => TransactionDraft(
    rawText: rawText,
    type: result.type,
    amountFcfa: result.amountFcfa,
    quantity: result.quantity,
    unit: result.unit,
    unknownUnitText: result.unknownUnitText,
    product: result.product,
    category: result.category,
    confidence: result.confidence,
    revision: revision,
  );

  bool get isAnalyzed => revision > 0;

  bool get needsReview => isAnalyzed && confidence < lowConfidenceThreshold;

  bool get typeNeedsCheck => needsReview && type == null;

  bool get amountNeedsCheck => needsReview && amountFcfa == null;

  bool get canSave => type != null && (amountFcfa ?? 0) > 0;
}
