// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryFilterController)
final historyFilterControllerProvider = HistoryFilterControllerProvider._();

final class HistoryFilterControllerProvider
    extends $NotifierProvider<HistoryFilterController, HistoryFilter> {
  HistoryFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyFilterControllerHash();

  @$internal
  @override
  HistoryFilterController create() => HistoryFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryFilter>(value),
    );
  }
}

String _$historyFilterControllerHash() =>
    r'45a9730c0bd35e87adf359bfc01ddac47511a41a';

abstract class _$HistoryFilterController extends $Notifier<HistoryFilter> {
  HistoryFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<HistoryFilter, HistoryFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HistoryFilter, HistoryFilter>,
              HistoryFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
