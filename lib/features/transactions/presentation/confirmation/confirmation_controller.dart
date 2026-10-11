import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:noodo/features/transactions/domain/local_unit.dart';
import 'package:noodo/features/transactions/domain/parser/french_text.dart';
import 'package:noodo/features/transactions/domain/parser/parse_result.dart';
import 'package:noodo/features/transactions/domain/parser/transaction_parser.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/confirmation/transaction_draft.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'confirmation_controller.g.dart';

const _idsPerRevision = 1000;

final class SaveOutcome {
  const SaveOutcome({
    required this.isUpdate,
    required this.count,
    required this.taxSavedFcfa,
  });

  final bool isUpdate;
  final int count;
  final int taxSavedFcfa;
}

@riverpod
class ConfirmationController extends _$ConfirmationController {
  static const _parser = TransactionParser();
  static const _uuid = Uuid();

  @override
  ConfirmationState build() => const ConfirmationState();

  Future<void> analyze(String transcript) async {
    final text = transcript.trim();
    if (text.isEmpty) return;
    final units = await ref.read(unitsProvider.future);
    if (!ref.mounted) return;
    final revision = state.revision + 1;
    final results = _parser.parseAll(text, units);
    final editing = state.isEditing ? state.items.single : null;
    final drafts = [
      for (final (index, result) in results.indexed)
        TransactionDraft.fromParse(
          result,
          id: revision * _idsPerRevision + index,
        ),
    ];
    state = ConfirmationState(
      rawText: text,
      revision: revision,
      items: editing == null
          ? drafts
          : [
              drafts.first.copyWith(
                editingId: editing.editingId,
                originalDate: editing.originalDate,
              ),
            ],
    );
  }

  Future<bool> loadForEdit(String id) async {
    final transaction = await ref
        .read(transactionRepositoryProvider)
        .findById(id);
    if (transaction == null || transaction.isCreditorPayment || !ref.mounted) {
      return false;
    }
    final revision = state.revision + 1;
    state = ConfirmationState(
      rawText: transaction.rawText,
      revision: revision,
      items: [
        TransactionDraft.fromTransaction(
          transaction,
          id: revision * _idsPerRevision,
        ),
      ],
    );
    return true;
  }

  void setType(int id, TransactionType type) =>
      _update(id, (item) => item.copyWith(type: type));

  void setAmount(int id, String value) {
    final amount = int.tryParse(value.replaceAll(RegExp(r'\s'), ''));
    _update(
      id,
      (item) => item.copyWith(
        amountFcfa: amount,
        statedPriceFcfa: amount,
        priceBasis: PriceBasis.total,
      ),
    );
  }

  void setQuantity(int id, String value) {
    final quantity = double.tryParse(value.trim().replaceAll(',', '.'));
    _update(id, (item) {
      final updated = item.copyWith(quantity: quantity);
      return item.priceBasis == PriceBasis.perUnit
          ? updated.copyWith(amountFcfa: updated.amountFor(PriceBasis.perUnit))
          : updated;
    });
  }

  void setPriceBasis(int id, PriceBasis basis) => _update(
    id,
    (item) =>
        item.copyWith(priceBasis: basis, amountFcfa: item.amountFor(basis)),
  );

  void setUnit(int id, LocalUnit? unit) =>
      _update(id, (item) => item.copyWith(unit: unit));

  void setProduct(int id, String value) => _update(
    id,
    (item) =>
        item.copyWith(product: value.trim().isEmpty ? null : value.trim()),
  );

  void setCategory(int id, TransactionCategory category) =>
      _update(id, (item) => item.copyWith(category: category));

  void remove(int id) {
    if (state.items.length <= 1) return;
    state = state.copyWith(
      items: [
        for (final item in state.items)
          if (item.id != id) item,
      ],
    );
  }

  Future<LocalUnit?> addUnknownUnit(int id) async {
    final text = state.item(id)?.unknownUnitText;
    if (text == null) return null;
    final unit = await ref
        .read(unitRepositoryProvider)
        .addCustom(singularize(text));
    ref.invalidate(unitsProvider);
    if (!ref.mounted) return unit;
    final folded = foldFrench(text);
    state = state.copyWith(
      revision: state.revision + 1,
      items: [
        for (final item in state.items)
          if (item.unknownUnitText case final other?
              when foldFrench(other) == folded)
            item.copyWith(unit: unit, unknownUnitText: null)
          else
            item,
      ],
    );
    return unit;
  }

  Future<SaveOutcome?> save() async {
    final current = state;
    if (!current.canSave) return null;
    final now = ref.read(clockProvider)();
    final transactions = [
      for (final item in current.items)
        Transaction(
          id: item.editingId ?? _uuid.v4(),
          type: item.type!,
          amountFcfa: item.amountFcfa!,
          quantity: item.quantity,
          unit: item.unit,
          product: item.product,
          category: item.category,
          rawText: current.rawText,
          date: item.originalDate ?? now,
        ),
    ];
    final repository = ref.read(transactionRepositoryProvider);
    if (current.isEditing) {
      await repository.update(transactions.single);
      return const SaveOutcome(isUpdate: true, count: 1, taxSavedFcfa: 0);
    }
    final result = await repository.addAll(transactions);
    return SaveOutcome(
      isUpdate: false,
      count: transactions.length,
      taxSavedFcfa: result.taxSavedFcfa,
    );
  }

  void _update(int id, TransactionDraft Function(TransactionDraft) change) {
    state = state.copyWith(
      items: [
        for (final item in state.items)
          if (item.id == id) change(item) else item,
      ],
    );
  }
}
