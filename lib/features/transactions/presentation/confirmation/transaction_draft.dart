import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

part 'transaction_draft.freezed.dart';

@freezed
abstract class TransactionDraft with _$TransactionDraft {
  const TransactionDraft._();

  const factory TransactionDraft({
    required int id,
    TransactionType? type,
    int? amountFcfa,
    double? quantity,
    LocalUnit? unit,
    String? unknownUnitText,
    String? product,
    @Default(TransactionCategory.other) TransactionCategory category,
    @Default(1.0) double confidence,
    int? statedPriceFcfa,
    @Default(PriceBasis.total) PriceBasis priceBasis,
    String? editingId,
    DateTime? originalDate,
  }) = _TransactionDraft;

  factory TransactionDraft.fromTransaction(
    Transaction transaction, {
    required int id,
  }) => TransactionDraft(
    id: id,
    type: transaction.type,
    amountFcfa: transaction.amountFcfa,
    quantity: transaction.quantity,
    unit: transaction.unit,
    product: transaction.product,
    category: transaction.category,
    statedPriceFcfa: transaction.amountFcfa,
    editingId: transaction.id,
    originalDate: transaction.date,
  );

  factory TransactionDraft.fromParse(ParseResult result, {required int id}) =>
      TransactionDraft(
        id: id,
        type: result.type,
        amountFcfa: result.amountFcfa,
        quantity: result.quantity,
        unit: result.unit,
        unknownUnitText: result.unknownUnitText,
        product: result.product,
        category: result.category,
        confidence: result.confidence,
        statedPriceFcfa: result.statedPriceFcfa,
        priceBasis: result.priceBasis,
      );

  bool get isEditing => editingId != null;

  bool get needsReview => confidence < lowConfidenceThreshold;

  bool get typeNeedsCheck => needsReview && type == null;

  bool get amountNeedsCheck => needsReview && amountFcfa == null;

  bool get canSave => type != null && (amountFcfa ?? 0) > 0;

  bool get canChoosePriceBasis =>
      quantity != null && quantity! > 0 && statedPriceFcfa != null;

  int? amountFor(PriceBasis basis) {
    final stated = statedPriceFcfa;
    final count = quantity;
    if (stated == null) return amountFcfa;
    return basis == PriceBasis.perUnit && count != null
        ? (stated * count).round()
        : stated;
  }
}

@freezed
abstract class ConfirmationState with _$ConfirmationState {
  const ConfirmationState._();

  const factory ConfirmationState({
    @Default('') String rawText,
    @Default(<TransactionDraft>[]) List<TransactionDraft> items,
    @Default(0) int revision,
  }) = _ConfirmationState;

  bool get isAnalyzed => revision > 0 && items.isNotEmpty;

  bool get isEditing => items.length == 1 && items.single.isEditing;

  bool get canSave => items.isNotEmpty && items.every((item) => item.canSave);

  TransactionDraft? item(int id) {
    for (final item in items) {
      if (item.id == id) return item;
    }
    return null;
  }
}
