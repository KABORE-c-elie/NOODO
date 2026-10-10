import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/profits/domain/profit_models.dart';
import 'package:noodo/features/profits/presentation/providers/today_profit_summary_provider.dart';
import 'package:noodo/features/transactions/data/transaction_providers.dart';

import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;
  final now = DateTime(2026, 10, 14, 15);

  setUp(() {
    db = createMemoryDatabase();
    container = ProviderContainer.test(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => now),
      ],
    );
  });

  tearDown(() => db.close());

  test('résume uniquement les transactions du jour', () async {
    final repository = container.read(transactionRepositoryProvider);
    await repository.add(sale('v1', 5000, DateTime(2026, 10, 14, 8)));
    await repository.add(expense('d1', 1500, DateTime(2026, 10, 14, 10)));
    await repository.add(sale('hier', 9000, DateTime(2026, 10, 13, 18)));
    container.listen(todayProfitSummaryProvider, (_, _) {});

    final summary = await container.read(todayProfitSummaryProvider.future);

    expect(summary.salesFcfa, 5000);
    expect(summary.expensesFcfa, 1500);
    expect(summary.netFcfa, 3500);
  });

  test('se met à jour quand une transaction est ajoutée', () async {
    final values = <int>[];
    container.listen<AsyncValue<ProfitSummary>>(
      todayProfitSummaryProvider,
      (_, next) => next.whenData((summary) => values.add(summary.netFcfa)),
      fireImmediately: true,
    );

    await container.read(todayProfitSummaryProvider.future);
    await container
        .read(transactionRepositoryProvider)
        .add(sale('v1', 2000, DateTime(2026, 10, 14, 9)));
    await pumpEventQueue();

    expect(values, [0, 2000]);
  });
}
