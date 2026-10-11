// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reminderScheduler)
final reminderSchedulerProvider = ReminderSchedulerProvider._();

final class ReminderSchedulerProvider
    extends
        $FunctionalProvider<
          ReminderScheduler,
          ReminderScheduler,
          ReminderScheduler
        >
    with $Provider<ReminderScheduler> {
  ReminderSchedulerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderSchedulerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderSchedulerHash();

  @$internal
  @override
  $ProviderElement<ReminderScheduler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReminderScheduler create(Ref ref) {
    return reminderScheduler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReminderScheduler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReminderScheduler>(value),
    );
  }
}

String _$reminderSchedulerHash() => r'be7571a0b5f5b383c0752ec8bf9d7a94d39bce9c';

@ProviderFor(plannedReminders)
final plannedRemindersProvider = PlannedRemindersProvider._();

final class PlannedRemindersProvider
    extends
        $FunctionalProvider<
          List<ScheduledReminder>,
          List<ScheduledReminder>,
          List<ScheduledReminder>
        >
    with $Provider<List<ScheduledReminder>> {
  PlannedRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plannedRemindersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plannedRemindersHash();

  @$internal
  @override
  $ProviderElement<List<ScheduledReminder>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ScheduledReminder> create(Ref ref) {
    return plannedReminders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ScheduledReminder> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ScheduledReminder>>(value),
    );
  }
}

String _$plannedRemindersHash() => r'9fed095c76dff676ab710c89e3686a7c3a84b384';

@ProviderFor(reminderSync)
final reminderSyncProvider = ReminderSyncProvider._();

final class ReminderSyncProvider extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  ReminderSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderSyncHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return reminderSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$reminderSyncHash() => r'e706b21a348b7d425044e2918b568a159e2d6acd';
