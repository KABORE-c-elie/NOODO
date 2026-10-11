import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/domain/transaction_category.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';

extension TransactionTypeLabel on TransactionType {
  String label(AppLocalizations l10n) => switch (this) {
    TransactionType.sale => l10n.transactionTypeSale,
    TransactionType.expense => l10n.transactionTypeExpense,
  };
}

extension TransactionCategoryLabel on TransactionCategory {
  String label(AppLocalizations l10n) => switch (this) {
    TransactionCategory.vegetables => l10n.categoryVegetables,
    TransactionCategory.cereals => l10n.categoryCereals,
    TransactionCategory.transport => l10n.categoryTransport,
    TransactionCategory.supplies => l10n.categorySupplies,
    TransactionCategory.other => l10n.categoryOther,
  };
}
