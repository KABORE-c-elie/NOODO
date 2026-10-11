import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/features/nodes/domain/creditor_node.dart';
import 'package:noodo/features/nodes/domain/reminder_planner.dart';
import 'package:noodo/features/nodes/domain/tax_node.dart';

void main() {
  const planner = ReminderPlanner();
  final now = DateTime(2026, 10, 14, 15);
  final taxNode = TaxNode.initial();

  test('impôts : rappels à 15 jours puis 5 jours, à 9 h', () {
    final reminders = planner.plan(
      taxNode: taxNode.copyWith(nextDueDate: DateTime(2026, 11, 15)),
      creditors: const [],
      now: now,
    );

    expect(reminders.map((r) => (r.kind, r.at)), [
      (ReminderKind.taxFifteenDays, DateTime(2026, 10, 31, 9)),
      (ReminderKind.taxFiveDays, DateTime(2026, 11, 10, 9)),
    ]);
  });

  test('impôts : un rappel déjà passé n\'est pas programmé', () {
    final reminders = planner.plan(
      taxNode: taxNode.copyWith(nextDueDate: DateTime(2026, 10, 25)),
      creditors: const [],
      now: now,
    );

    expect(reminders.single.kind, ReminderKind.taxFiveDays);
    expect(reminders.single.at, DateTime(2026, 10, 20, 9));
  });

  test('créancier : rappel la veille de l\'échéance', () {
    final reminders = planner.plan(
      taxNode: taxNode,
      creditors: [
        CreditorNode(
          id: 'awa',
          supplierName: 'Maman Awa',
          balanceDueFcfa: 5000,
          dueDate: DateTime(2026, 11, 1),
        ),
      ],
      now: now,
    );

    expect(reminders.single.kind, ReminderKind.creditorDayBefore);
    expect(reminders.single.at, DateTime(2026, 10, 31, 9));
    expect(reminders.single.creditorName, 'Maman Awa');
    expect(reminders.single.amountFcfa, 5000);
    expect(reminders.single.id, creditorReminderId('awa'));
  });

  test('créancier soldé, sans échéance ou échéance passée : aucun rappel', () {
    final reminders = planner.plan(
      taxNode: taxNode,
      creditors: [
        CreditorNode(
          id: 'solde',
          supplierName: 'Soldé',
          balanceDueFcfa: 0,
          dueDate: DateTime(2026, 11, 1),
        ),
        const CreditorNode(
          id: 'sans',
          supplierName: 'Sans',
          balanceDueFcfa: 100,
        ),
        CreditorNode(
          id: 'passe',
          supplierName: 'Passé',
          balanceDueFcfa: 100,
          dueDate: DateTime(2026, 10, 14),
        ),
      ],
      now: now,
    );

    expect(reminders, isEmpty);
  });

  test('changement de mois et d\'année géré par le calendrier', () {
    final reminders = planner.plan(
      taxNode: taxNode.copyWith(nextDueDate: DateTime(2027, 1, 3)),
      creditors: [
        CreditorNode(
          id: 'awa',
          supplierName: 'Maman Awa',
          balanceDueFcfa: 1,
          dueDate: DateTime(2026, 12, 1),
        ),
      ],
      now: now,
    );

    expect(reminders.map((r) => r.at), [
      DateTime(2026, 11, 30, 9),
      DateTime(2026, 12, 19, 9),
      DateTime(2026, 12, 29, 9),
    ]);
  });

  test('identifiants stables, distincts et hors de la plage des impôts', () {
    expect(creditorReminderId('awa'), creditorReminderId('awa'));
    expect(creditorReminderId('awa'), isNot(creditorReminderId('amadou')));
    expect(creditorReminderId('awa'), greaterThanOrEqualTo(1000));
  });
}
