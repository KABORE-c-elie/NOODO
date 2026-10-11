import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/presentation/creditor_actions.dart';
import 'package:noodo/features/nodes/presentation/node_labels.dart';
import 'package:noodo/features/nodes/presentation/widgets/receipt_dialog.dart';

Future<void> showPaymentSheet(
  BuildContext context,
  CreditorNode creditor,
) async {
  final payment = await showModalBottomSheet<CreditorPayment>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _PaymentSheet(creditor: creditor),
  );
  if (payment != null && context.mounted) {
    await showReceiptDialog(context, payment);
  }
}

class _PaymentSheet extends ConsumerStatefulWidget {
  const _PaymentSheet({required this.creditor});

  final CreditorNode creditor;

  @override
  ConsumerState<_PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends ConsumerState<_PaymentSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _reason = TextEditingController();
  PaymentMethod _method = PaymentMethod.cash;
  bool _submitting = false;

  @override
  void dispose() {
    _amount.dispose();
    _reason.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting || !_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    final navigator = Navigator.of(context);
    final l10n = AppLocalizations.of(context);
    final payment = await ref
        .read(creditorActionsProvider)
        .recordPayment(
          creditorId: widget.creditor.id,
          amountFcfa: int.parse(_amount.text),
          method: _method,
          reason: _reason.text,
          expenseText: l10n.paymentExpenseText(widget.creditor.supplierName),
        );
    navigator.pop(payment);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final balance = widget.creditor.balanceDueFcfa;
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
                l10n.recordPayment,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(l10n.balanceDue(balance)),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _amount,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: l10n.paymentAmountLabel),
                validator: (value) {
                  final amount = int.tryParse(value ?? '') ?? 0;
                  if (amount <= 0) return l10n.invalidAmount;
                  if (amount > balance) return l10n.amountTooHigh(balance);
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(l10n.paymentMethodLabel),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  for (final method in PaymentMethod.values)
                    ChoiceChip(
                      label: Text(method.label(l10n)),
                      tooltip: method.label(l10n),
                      selected: _method == method,
                      onSelected: (_) => setState(() => _method = method),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _reason,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: l10n.paymentReasonLabel),
              ),
              const SizedBox(height: AppSpacing.xl),
              Tooltip(
                message: l10n.confirmPayment,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  onPressed: _submitting ? null : _submit,
                  child: Text(l10n.confirmPayment),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
