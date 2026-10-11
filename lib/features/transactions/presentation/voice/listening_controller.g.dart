// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListeningController)
final listeningControllerProvider = ListeningControllerProvider._();

final class ListeningControllerProvider
    extends $NotifierProvider<ListeningController, ListeningState> {
  ListeningControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listeningControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listeningControllerHash();

  @$internal
  @override
  ListeningController create() => ListeningController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListeningState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListeningState>(value),
    );
  }
}

String _$listeningControllerHash() =>
    r'c30039789890d5d128c7e6a1178711fef535e00c';

abstract class _$ListeningController extends $Notifier<ListeningState> {
  ListeningState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ListeningState, ListeningState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListeningState, ListeningState>,
              ListeningState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
