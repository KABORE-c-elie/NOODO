import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/nodes/data/drift_node_repository.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/creditor_payment.dart';
import 'package:noodo/features/nodes/domain/payment_method.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';

import '../../../helpers/fake_reminder_scheduler.dart';
import '../../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftNodeRepository nodes;
  late FakeReminderScheduler scheduler;
  final now = DateTime(2026, 10, 14, 15);

  setUpAll(initializeDateFormatting);

  setUp(() {
    db = createMemoryDatabase();
    nodes = DriftNodeRepository(db);
    scheduler = FakeReminderScheduler();
    final container = ProviderContainer.test(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => now),
        reminderSchedulerProvider.overrideWithValue(scheduler),
      ],
    );
    container.listen(reminderSyncProvider, (_, _) {});
  });

  tearDown(() => db.close());

  Future<void> settle() async {
    for (var i = 0; i < 5; i++) {
      await pumpEventQueue();
    }
  }

  test('reprogramme quand une échéance change et annule quand le créancier est soldé', () async {
    await nodes.addCreditor(
      CreditorNode(
        id: 'awa',
        supplierName: 'Maman Awa',
        balanceDueFcfa: 5000,
        dueDate: DateTime(2026, 11, 1),
      ),
    );
    await settle();
    expect(scheduler.current.single.at, DateTime(2026, 10, 31, 9));
    expect(scheduler.current.single.title, 'Demain : paiement à Maman Awa');

    final awa = (await nodes.findCreditor('awa'))!;
    await nodes.updateCreditor(awa.copyWith(dueDate: DateTime(2026, 11, 20)));
    await settle();
    expect(scheduler.current.single.at, DateTime(2026, 11, 19, 9));

    await nodes.recordPayment(
      PaymentRequest(
        paymentId: 'p1',
        transactionId: 'tx1',
        creditorId: 'awa',
        amountFcfa: 5000,
        method: PaymentMethod.cash,
        date: now,
        expenseText: 'Paiement',
      ),
    );
    await settle();
    expect(scheduler.current, isEmpty);
  });

  test(
    'échéance fiscale : deux rappels, retirés si l\'échéance est effacée',
    () async {
      final taxNode = await nodes.getTaxNode();
      await nodes.updateTaxNode(
        taxNode.copyWith(nextDueDate: DateTime(2026, 12, 15)),
      );
      await settle();
      expect(scheduler.current.map((r) => r.id), [1, 2]);
      expect(scheduler.current.first.body, contains('15 jours'));

      await nodes.updateTaxNode(taxNode.copyWith(nextDueDate: null));
      await settle();
      expect(scheduler.current, isEmpty);
    },
  );
}
