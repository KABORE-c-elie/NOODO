import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/presentation/receipt_text.dart';

Future<void> showReceiptDialog(BuildContext context, CreditorPayment payment) =>
    showDialog<void>(
      context: context,
      builder: (_) => _ReceiptDialog(payment: payment),
    );

class _ReceiptDialog extends ConsumerWidget {
  const _ReceiptDialog({required this.payment});

  final CreditorPayment payment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final text = buildReceiptText(
      payment,
      l10n,
      Localizations.localeOf(context).toLanguageTag(),
    );
    return AlertDialog(
      title: Text(l10n.receiptTitle),
      content: SingleChildScrollView(
        child: SelectableText(
          text,
          style: const TextStyle(fontFamily: 'monospace', height: 1.4),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.close),
        ),
        Tooltip(
          message: l10n.shareReceiptTooltip,
          child: FilledButton.icon(
            icon: const Icon(Icons.share),
            label: Text(l10n.share),
            onPressed: () => ref
                .read(receiptSharerProvider)
                .share(
                  text: text,
                  subject: l10n.receiptShareSubject(payment.receiptNumber),
                ),
          ),
        ),
      ],
    );
  }
}
