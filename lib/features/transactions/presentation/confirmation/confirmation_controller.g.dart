// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfirmationController)
final confirmationControllerProvider = ConfirmationControllerProvider._();

final class ConfirmationControllerProvider
    extends $NotifierProvider<ConfirmationController, ConfirmationState> {
  ConfirmationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'confirmationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$confirmationControllerHash();

  @$internal
  @override
  ConfirmationController create() => ConfirmationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfirmationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfirmationState>(value),
    );
  }
}

String _$confirmationControllerHash() =>
    r'696509cdd4747c069f3cbc2382fcfeafeff904e1';

abstract class _$ConfirmationController extends $Notifier<ConfirmationState> {
  ConfirmationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ConfirmationState, ConfirmationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConfirmationState, ConfirmationState>,
              ConfirmationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
