import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/utils/current_day_provider.dart';
import 'package:noodo/core/utils/date_range.dart';
import 'package:noodo/features/profits/data/drift_anomaly_dismissals.dart';
import 'package:noodo/features/profits/domain/anomaly.dart';
import 'package:noodo/features/profits/domain/anomaly_detector.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anomalies_provider.g.dart';

@Riverpod(keepAlive: true)
AnomalyDismissals anomalyDismissals(Ref ref) =>
    DriftAnomalyDismissals(ref.watch(appDatabaseProvider));

@riverpod
Stream<Set<AnomalyType>> dismissedAnomalies(Ref ref) => ref
    .watch(anomalyDismissalsProvider)
    .watchDismissed(ref.watch(currentDayProvider));

@riverpod
Stream<List<Anomaly>> anomalies(Ref ref) {
  final today = ref.watch(currentDayProvider);
  final sensitivity = ref.watch(alertSensitivityProvider);
  final dismissed = ref.watch(dismissedAnomaliesProvider).value;
  if (dismissed == null) return const Stream.empty();
  const detector = AnomalyDetector();
  final range = DateRange(
    start: DateTime(
      today.year,
      today.month,
      today.day - expenseLookbackDays - 1,
    ),
    end: DateTime(today.year, today.month, today.day + 1),
  );
  return ref
      .watch(transactionRepositoryProvider)
      .watchInRange(range)
      .map(
        (transactions) => [
          for (final anomaly in detector.detect(
            transactions: transactions,
            today: today,
            sensitivity: sensitivity,
          ))
            if (!dismissed.contains(anomaly.type)) anomaly,
        ],
      );
}
