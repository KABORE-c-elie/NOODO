import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/presentation/node_labels.dart';
import 'package:noodo/features/nodes/presentation/widgets/creditor_tile.dart';
import 'package:noodo/features/nodes/presentation/widgets/payment_sheet.dart';
import 'package:noodo/features/nodes/presentation/widgets/receipt_dialog.dart';
import 'package:noodo/features/receipts/presentation/widgets/creditor_photos.dart';

class CreditorScreen extends ConsumerWidget {
  const CreditorScreen({super.key, required this.creditorId});

  final String creditorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final creditor = ref.watch(creditorProvider(creditorId));
    return Scaffold(
      appBar: AppBar(
        title: Text(creditor.value?.supplierName ?? l10n.creditorTitle),
      ),
      body: switch (creditor) {
        AsyncData(value: final value?) => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: _CreditorSummary(creditor: value),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              sliver: SliverToBoxAdapter(
                child: CreditorPhotos(creditorId: creditorId),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.paymentsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _PaymentsSliver(creditorId: creditorId),
          ],
        ),
        AsyncData() => Center(child: Text(l10n.creditorNotFound)),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _CreditorSummary extends ConsumerWidget {
  const _CreditorSummary({required this.creditor});

  final CreditorNode creditor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final totalPaid = ref.watch(
      creditorPaymentsProvider(creditor.id).select(
        (payments) => payments.whenData(
          (list) => list.fold(0, (sum, payment) => sum + payment.amountFcfa),
        ),
      ),
    );
    final isOverdue = creditor.isOverdue(ref.watch(currentDayProvider));
    final dueDate = creditor.dueDate;
    final phone = creditor.phone;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.balanceDue(creditor.balanceDueFcfa),
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    dueDate == null
                        ? l10n.noDueDate
                        : l10n.dueOn(DateFormat.yMMMMd(locale).format(dueDate)),
                  ),
                ),
                if (isOverdue) const OverdueBadge(),
              ],
            ),
            if (phone != null) Text(phone),
            Text(l10n.totalPaid(totalPaid.value ?? 0)),
            const SizedBox(height: 16),
            Tooltip(
              message: l10n.recordPaymentTooltip,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                ),
                icon: const Icon(Icons.payments_outlined),
                label: Text(l10n.recordPayment),
                onPressed: creditor.balanceDueFcfa > 0
                    ? () => showPaymentSheet(context, creditor)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentsSliver extends ConsumerWidget {
  const _PaymentsSliver({required this.creditorId});

  final String creditorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final payments = ref.watch(creditorPaymentsProvider(creditorId));
    return switch (payments) {
      AsyncData(:final value) when value.isEmpty => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.noPayments, textAlign: TextAlign.center),
        ),
      ),
      AsyncData(:final value) => SliverList.builder(
        itemCount: value.length,
        itemBuilder: (context, index) =>
            _PaymentTile(key: ValueKey(value[index].id), payment: value[index]),
      ),
      _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
    };
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({super.key, required this.payment});

  final CreditorPayment payment;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final summary = l10n.paymentSummary(
      DateFormat.yMMMd(locale).format(payment.date),
      payment.method.label(l10n),
      payment.receiptNumber,
    );
    final amount = l10n.amountFcfa(payment.amountFcfa);
    void open() => showReceiptDialog(context, payment);
    return Semantics(
      container: true,
      excludeSemantics: true,
      button: true,
      onTap: open,
      onTapHint: l10n.viewReceiptHint,
      label: '$amount, $summary',
      child: ListTile(
        onTap: open,
        leading: const Icon(Icons.receipt_long_outlined),
        title: Text(amount),
        subtitle: Text(summary),
      ),
    );
  }
}
