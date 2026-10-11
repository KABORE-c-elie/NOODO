import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/receipts/presentation/photo_actions.dart';
import 'package:noodo/features/transactions/presentation/providers/recent_transactions_provider.dart';

Future<void> takeAndAttachPhoto(
  BuildContext context,
  WidgetRef ref, {
  String? creditorId,
}) async {
  final actions = ref.read(photoActionsProvider);
  final fileName = await actions.capture();
  if (fileName == null) return;
  if (!context.mounted) {
    await actions.discard(fileName);
    return;
  }
  final saved = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) =>
        _AttachPhotoSheet(fileName: fileName, initialCreditorId: creditorId),
  );
  if (saved != true) await actions.discard(fileName);
}

sealed class _Link {
  const _Link();
}

final class _NoLink extends _Link {
  const _NoLink();

  @override
  bool operator ==(Object other) => other is _NoLink;

  @override
  int get hashCode => 0;
}

final class _PaymentLink extends _Link {
  const _PaymentLink(this.id);

  final String id;

  @override
  bool operator ==(Object other) => other is _PaymentLink && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

final class _TransactionLink extends _Link {
  const _TransactionLink(this.id);

  final String id;

  @override
  bool operator ==(Object other) => other is _TransactionLink && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class _AttachPhotoSheet extends ConsumerStatefulWidget {
  const _AttachPhotoSheet({required this.fileName, this.initialCreditorId});

  final String fileName;
  final String? initialCreditorId;

  @override
  ConsumerState<_AttachPhotoSheet> createState() => _AttachPhotoSheetState();
}

class _AttachPhotoSheetState extends ConsumerState<_AttachPhotoSheet> {
  final _formKey = GlobalKey<FormState>();
  late String? _creditorId = widget.initialCreditorId;
  _Link _link = const _NoLink();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final navigator = Navigator.of(context);
    final link = _link;
    await ref
        .read(photoActionsProvider)
        .attach(
          fileName: widget.fileName,
          creditorId: _creditorId,
          paymentId: link is _PaymentLink ? link.id : null,
          transactionId: link is _TransactionLink ? link.id : null,
        );
    navigator.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creditors =
        ref.watch(creditorsProvider).value ?? const <CreditorNode>[];
    final creditorId = _creditorId;
    final payments = creditorId == null
        ? null
        : ref.watch(creditorPaymentsProvider(creditorId)).value;
    final transactions = ref.watch(recentTransactionsProvider).value;
    final links = <(_Link, String)>[
      (const _NoLink(), l10n.photoNoLink),
      for (final payment in payments ?? const [])
        (
          _PaymentLink(payment.id),
          l10n.photoPaymentLink(payment.receiptNumber, payment.amountFcfa),
        ),
      for (final transaction in transactions ?? const [])
        if (!transaction.isCreditorPayment)
          (
            _TransactionLink(transaction.id),
            l10n.photoTransactionLink(
              transaction.product ?? transaction.rawText,
              transaction.amountFcfa,
            ),
          ),
    ];
    final selectedLink = links.any((entry) => entry.$1 == _link)
        ? _link
        : const _NoLink();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.attachPhotoTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              if (creditors.isEmpty)
                Text(l10n.noCreditorsForPhoto)
              else
                DropdownButtonFormField<String>(
                  initialValue: creditorId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: l10n.photoCreditorLabel,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null ? l10n.requiredField : null,
                  onChanged: (value) => setState(() {
                    _creditorId = value;
                    _link = const _NoLink();
                  }),
                  items: [
                    for (final creditor in creditors)
                      DropdownMenuItem(
                        value: creditor.id,
                        child: Text(creditor.supplierName),
                      ),
                  ],
                ),
              const SizedBox(height: 12),
              DropdownButtonFormField<_Link>(
                key: ValueKey(creditorId),
                initialValue: selectedLink,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: l10n.photoLinkLabel,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) =>
                    setState(() => _link = value ?? const _NoLink()),
                items: [
                  for (final (link, label) in links)
                    DropdownMenuItem(
                      value: link,
                      child: Text(label, overflow: TextOverflow.ellipsis),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: l10n.savePhotoTooltip,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _submit,
                  child: Text(l10n.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
