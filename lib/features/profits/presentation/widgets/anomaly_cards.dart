import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';
import 'package:noodo/features/profits/presentation/providers/anomalies_provider.dart';
import 'package:noodo/features/transactions/presentation/transaction_labels.dart';

class AnomalyCards extends ConsumerWidget {
  const AnomalyCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anomalies = ref.watch(anomaliesProvider).value ?? const <Anomaly>[];
    if (anomalies.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        for (final anomaly in anomalies)
          _AnomalyCard(key: ValueKey(anomaly.type), anomaly: anomaly),
      ],
    );
  }
}

class _AnomalyCard extends ConsumerWidget {
  const _AnomalyCard({super.key, required this.anomaly});

  final Anomaly anomaly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final (message, advice) = switch (anomaly.type) {
      AnomalyType.unusualExpense => (
        l10n.unusualExpenseMessage(
          anomaly.label ?? '',
          anomaly.amountFcfa,
          anomaly.category?.label(l10n) ?? '',
          anomaly.averageFcfa,
        ),
        l10n.unusualExpenseAdvice,
      ),
      AnomalyType.lowProfitDay => (
        l10n.lowProfitMessage(anomaly.amountFcfa, anomaly.averageFcfa),
        l10n.lowProfitAdvice,
      ),
    };
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Card(
        color: colors.tertiaryContainer,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 4, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  Icons.lightbulb_outline,
                  color: colors.onTertiaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Semantics(
                  container: true,
                  label: '$message $advice',
                  excludeSemantics: true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            color: colors.onTertiaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          advice,
                          style: TextStyle(color: colors.onTertiaryContainer),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                tooltip: l10n.dismissAlert,
                icon: const Icon(Icons.close),
                onPressed: () => ref
                    .read(anomalyDismissalsProvider)
                    .dismiss(anomaly.type, ref.read(currentDayProvider)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
