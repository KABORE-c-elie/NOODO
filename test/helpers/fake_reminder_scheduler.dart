import 'package:noodo/features/nodes/domain/reminder_planner.dart';

class FakeReminderScheduler implements ReminderScheduler {
  FakeReminderScheduler({this.grantPermission = true});

  bool grantPermission;
  int permissionRequests = 0;
  final scheduled = <List<ScheduledReminder>>[];

  List<ScheduledReminder> get current =>
      scheduled.isEmpty ? const [] : scheduled.last;

  @override
  Future<bool> requestPermission() async {
    permissionRequests++;
    return grantPermission;
  }

  @override
  Future<void> replaceAll(List<ScheduledReminder> reminders) async {
    scheduled.add(List.of(reminders));
  }

  final scheduledOnce = <ScheduledReminder>[];

  @override
  Future<void> scheduleOne(ScheduledReminder reminder) async {
    scheduledOnce.add(reminder);
  }
}
