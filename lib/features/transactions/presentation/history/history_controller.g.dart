// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryController)
final historyControllerProvider = HistoryControllerProvider._();

final class HistoryControllerProvider
    extends $AsyncNotifierProvider<HistoryController, HistoryState> {
  HistoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyControllerHash();

  @$internal
  @override
  HistoryController create() => HistoryController();
}

String _$historyControllerHash() => r'0b94e8807b1d936a080af969ecf35ce06fb7ad5e';

abstract class _$HistoryController extends $AsyncNotifier<HistoryState> {
  FutureOr<HistoryState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HistoryState>, HistoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HistoryState>, HistoryState>,
              AsyncValue<HistoryState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
