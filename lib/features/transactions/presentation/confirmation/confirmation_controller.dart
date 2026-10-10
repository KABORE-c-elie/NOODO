import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/french_text.dart';
import 'package:noodo/features/transactions/domain/parser/transaction_parser.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/confirmation/transaction_draft.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'confirmation_controller.g.dart';

@riverpod
class ConfirmationController extends _$ConfirmationController {
  static const _parser = TransactionParser();
  static const _uuid = Uuid();

  @override
  TransactionDraft build() => const TransactionDraft();

  Future<void> analyze(String transcript) async {
    final text = transcript.trim();
    if (text.isEmpty) return;
    final units = await ref.read(unitsProvider.future);
    if (!ref.mounted) return;
    state = TransactionDraft.fromParse(
      text,
      _parser.parse(text, units),
      revision: state.revision + 1,
    ).copyWith(editingId: state.editingId, originalDate: state.originalDate);
  }

  Future<bool> loadForEdit(String id) async {
    final transaction = await ref
        .read(transactionRepositoryProvider)
        .findById(id);
    if (transaction == null || !ref.mounted) return false;
    state = TransactionDraft.fromTransaction(
      transaction,
      revision: state.revision + 1,
    );
    return true;
  }

  void setType(TransactionType type) => state = state.copyWith(type: type);

  void setAmount(String value) => state = state.copyWith(
    amountFcfa: int.tryParse(value.replaceAll(RegExp(r'\s'), '')),
  );

  void setQuantity(String value) => state = state.copyWith(
    quantity: double.tryParse(value.trim().replaceAll(',', '.')),
  );

  void setUnit(LocalUnit? unit) => state = state.copyWith(unit: unit);

  void setProduct(String value) => state = state.copyWith(
    product: value.trim().isEmpty ? null : value.trim(),
  );

  void setCategory(TransactionCategory category) =>
      state = state.copyWith(category: category);

  Future<LocalUnit?> addUnknownUnit() async {
    final text = state.unknownUnitText;
    if (text == null) return null;
    final unit = await ref
        .read(unitRepositoryProvider)
        .addCustom(singularize(text));
    ref.invalidate(unitsProvider);
    if (!ref.mounted) return unit;
    state = state.copyWith(
      unit: unit,
      unknownUnitText: null,
      revision: state.revision + 1,
    );
    return unit;
  }

  Future<bool> save() async {
    final draft = state;
    final type = draft.type;
    final amount = draft.amountFcfa;
    if (!draft.canSave || type == null || amount == null) return false;
    final repository = ref.read(transactionRepositoryProvider);
    final transaction = Transaction(
      id: draft.editingId ?? _uuid.v4(),
      type: type,
      amountFcfa: amount,
      quantity: draft.quantity,
      unit: draft.unit,
      product: draft.product,
      category: draft.category,
      rawText: draft.rawText,
      date: draft.originalDate ?? ref.read(clockProvider)(),
    );
    if (draft.isEditing) {
      await repository.update(transaction);
    } else {
      await repository.add(transaction);
    }
    return true;
  }
}
