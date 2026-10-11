import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/utils/clock_provider.dart';
import 'package:noodo/features/nodes/data/local_notification_scheduler.dart';
import 'package:noodo/features/nodes/data/node_providers.dart';
import 'package:noodo/features/nodes/domain/reminder_planner.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_sync.g.dart';

@Riverpod(keepAlive: true)
ReminderScheduler reminderScheduler(Ref ref) => LocalNotificationScheduler();

@Riverpod(keepAlive: true)
List<ScheduledReminder> plannedReminders(Ref ref) {
  final taxNode = ref.watch(taxNodeProvider).value;
  final creditors = ref.watch(creditorsProvider).value;
  if (taxNode == null || creditors == null) return const [];
  final locale = ref.watch(appLocaleProvider);
  final l10n = lookupAppLocalizations(locale);
  final dateFormat = DateFormat.yMMMMd(locale.toLanguageTag());
  return [
    for (final reminder in const ReminderPlanner().plan(
      taxNode: taxNode,
      creditors: creditors,
      now: ref.read(clockProvider)(),
    ))
      ScheduledReminder(
        id: reminder.id,
        at: reminder.at,
        title: switch (reminder.kind) {
          ReminderKind.taxFifteenDays ||
          ReminderKind.taxFiveDays => l10n.taxReminderTitle,
          ReminderKind.creditorDayBefore => l10n.creditorReminderTitle(
            reminder.creditorName ?? '',
          ),
        },
        body: switch (reminder.kind) {
          ReminderKind.taxFifteenDays => l10n.taxReminderBody(
            15,
            dateFormat.format(reminder.dueDate),
          ),
          ReminderKind.taxFiveDays => l10n.taxReminderBody(
            5,
            dateFormat.format(reminder.dueDate),
          ),
          ReminderKind.creditorDayBefore => l10n.creditorReminderBody(
            reminder.amountFcfa ?? 0,
          ),
        },
      ),
  ];
}

@Riverpod(keepAlive: true)
void reminderSync(Ref ref) {
  final scheduler = ref.watch(reminderSchedulerProvider);
  ref.listen(plannedRemindersProvider, (previous, next) {
    if (previous != next) unawaited(scheduler.replaceAll(next));
  });
}

Future<void> requestReminderPermission({
  required ReminderScheduler scheduler,
  required ScaffoldMessengerState messenger,
  required String deniedMessage,
}) async {
  if (await scheduler.requestPermission()) return;
  messenger.showSnackBar(
    SnackBar(
      content: Text(deniedMessage),
      duration: const Duration(seconds: 6),
    ),
  );
}
