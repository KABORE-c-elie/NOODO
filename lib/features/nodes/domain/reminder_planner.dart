import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

part 'reminder_planner.freezed.dart';

enum ReminderKind { taxFifteenDays, taxFiveDays, creditorDayBefore }

@freezed
abstract class PlannedReminder with _$PlannedReminder {
  const factory PlannedReminder({
    required int id,
    required ReminderKind kind,
    required DateTime at,
    required DateTime dueDate,
    String? creditorId,
    String? creditorName,
    int? amountFcfa,
  }) = _PlannedReminder;
}

@freezed
abstract class ScheduledReminder with _$ScheduledReminder {
  const factory ScheduledReminder({
    required int id,
    required DateTime at,
    required String title,
    required String body,
  }) = _ScheduledReminder;
}

abstract interface class ReminderScheduler {
  Future<bool> requestPermission();

  Future<void> replaceAll(List<ScheduledReminder> reminders);

  Future<void> scheduleOne(ScheduledReminder reminder);
}

const _taxFifteenDaysId = 1;
const _taxFiveDaysId = 2;
const _creditorIdOffset = 1000;
const _idSpace = 0x3fffffff;

final class ReminderPlanner {
  const ReminderPlanner({this.hour = 9});

  final int hour;

  List<PlannedReminder> plan({
    required TaxNode taxNode,
    required List<CreditorNode> creditors,
    required DateTime now,
  }) {
    final taxDue = taxNode.nextDueDate;
    final reminders = [
      if (taxDue != null) ...[
        PlannedReminder(
          id: _taxFifteenDaysId,
          kind: ReminderKind.taxFifteenDays,
          at: _at(taxDue, daysBefore: 15),
          dueDate: taxDue,
        ),
        PlannedReminder(
          id: _taxFiveDaysId,
          kind: ReminderKind.taxFiveDays,
          at: _at(taxDue, daysBefore: 5),
          dueDate: taxDue,
        ),
      ],
      for (final creditor in creditors)
        if (creditor.dueDate case final due? when creditor.balanceDueFcfa > 0)
          PlannedReminder(
            id: creditorReminderId(creditor.id),
            kind: ReminderKind.creditorDayBefore,
            at: _at(due, daysBefore: 1),
            dueDate: due,
            creditorId: creditor.id,
            creditorName: creditor.supplierName,
            amountFcfa: creditor.balanceDueFcfa,
          ),
    ];
    return [
      for (final reminder in reminders)
        if (reminder.at.isAfter(now)) reminder,
    ]..sort((a, b) => a.at.compareTo(b.at));
  }

  DateTime _at(DateTime due, {required int daysBefore}) =>
      DateTime(due.year, due.month, due.day - daysBefore, hour);
}

int creditorReminderId(String creditorId) {
  var hash = 0x811c9dc5;
  for (final unit in creditorId.codeUnits) {
    hash = ((hash ^ unit) * 0x01000193) & 0xffffffff;
  }
  return _creditorIdOffset + hash % _idSpace;
}
