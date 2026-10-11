import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/theme/app_colors.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/transactions/domain/transaction.dart';
import 'package:noodo/features/transactions/domain/transaction_type.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    this.onTap,
    this.onDelete,
  });

  final Transaction transaction;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final isSale = transaction.type == TransactionType.sale;
    final appColors = AppColors.of(context);
    final color = isSale ? appColors.sale : appColors.expense;
    final time = DateFormat.Hm(Localizations.localeOf(context).toLanguageTag())
        .format(transaction.date);
    final label = transaction.product ?? transaction.rawText;
    final onDelete = this.onDelete;
    return Semantics(
      container: true,
      excludeSemantics: true,
      button: onTap != null,
      onTap: onTap,
      onTapHint: onTap == null
          ? null
          : transaction.isCreditorPayment
          ? l10n.openCreditorHint
          : l10n.editTransactionHint,
      label: l10n.transactionSemantics(
        transaction.type.label(l10n),
        label,
        transaction.amountFcfa,
      ),
      customSemanticsActions: onDelete == null
          ? null
          : {
              CustomSemanticsAction(label: l10n.deleteTransactionAction):
                  onDelete,
            },
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          isSale ? Icons.south_west : Icons.north_east,
          color: color,
        ),
        title: transaction.isCreditorPayment
            ? Row(
                children: [
                  Flexible(child: Text(label)),
                  const SizedBox(width: AppSpacing.sm),
                  Icon(
                    Icons.receipt_long,
                    size: 16,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              )
            : Text(label),
        subtitle: Text(time),
        trailing: Text(
          isSale
              ? l10n.saleAmount(transaction.amountFcfa)
              : l10n.expenseAmount(transaction.amountFcfa),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w800,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
