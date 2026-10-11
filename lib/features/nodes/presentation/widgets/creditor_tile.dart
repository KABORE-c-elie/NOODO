import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_routes.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/presentation/node_labels.dart';

class CreditorTile extends ConsumerWidget {
  const CreditorTile({super.key, required this.creditor});

  final CreditorNode creditor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final isOverdue = creditor.isOverdue(ref.watch(currentDayProvider));
    final dueDate = creditor.dueDate;
    final dueText = dueDate == null
        ? l10n.noDueDate
        : l10n.dueOn(DateFormat.yMMMd(locale).format(dueDate));
    final balance = l10n.balanceDue(creditor.balanceDueFcfa);
    void open() => context.push(AppRoutes.creditorPath(creditor.id));
    return Semantics(
      container: true,
      excludeSemantics: true,
      button: true,
      onTap: open,
      label: [
        creditor.supplierName,
        balance,
        dueText,
        if (isOverdue) l10n.overdue,
      ].join(', '),
      child: ListTile(
        onTap: open,
        title: Text(creditor.supplierName),
        subtitle: Text('$balance\n$dueText'),
        isThreeLine: true,
        trailing: isOverdue ? const OverdueBadge() : null,
      ),
    );
  }
}

class OverdueBadge extends StatelessWidget {
  const OverdueBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          AppLocalizations.of(context).overdue,
          style: TextStyle(
            color: colors.onErrorContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
