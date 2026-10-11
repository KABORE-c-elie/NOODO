import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/theme/app_spacing.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/nodes/domain/reminder_planner.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';
import 'package:noodo/features/settings/data/demo_data_seeder.dart';

const demoTransactionCount = 2000;
const _testReminderId = 999;
const _testReminderDelay = Duration(minutes: 2);

class DeveloperTools extends ConsumerWidget {
  const DeveloperTools({super.key});

  Future<void> _seed(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final count = await DemoDataSeeder(ref.read(appDatabaseProvider))
        .seed(count: demoTransactionCount, now: ref.read(clockProvider)());
    messenger.showSnackBar(
      SnackBar(content: Text(l10n.demoDataGenerated(count))),
    );
  }

  Future<void> _scheduleTestReminder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final scheduler = ref.read(reminderSchedulerProvider);
    if (!await scheduler.requestPermission()) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.notificationsDenied)));
      return;
    }
    final at = ref.read(clockProvider)().add(_testReminderDelay);
    await scheduler.scheduleOne(
      ScheduledReminder(
        id: _testReminderId,
        at: at,
        title: l10n.testReminderTitle,
        body: l10n.testReminderBody,
      ),
    );
    messenger.showSnackBar(SnackBar(content: Text(l10n.testReminderScheduled)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Tooltip(
          message: l10n.generateDemoData,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.dataset_outlined),
            label: Text(l10n.generateDemoData),
            onPressed: () => _seed(context, ref),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Tooltip(
          message: l10n.scheduleTestReminder,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.notifications_active_outlined),
            label: Text(l10n.scheduleTestReminder),
            onPressed: () => _scheduleTestReminder(context, ref),
          ),
        ),
      ],
    );
  }
}
