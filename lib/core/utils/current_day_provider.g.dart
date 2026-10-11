// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_day_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentDay)
final currentDayProvider = CurrentDayProvider._();

final class CurrentDayProvider extends $NotifierProvider<CurrentDay, DateTime> {
  CurrentDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentDayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentDayHash();

  @$internal
  @override
  CurrentDay create() => CurrentDay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$currentDayHash() => r'27793ed73028e8dab1ea5f74e43dd376208f23c6';

abstract class _$CurrentDay extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
