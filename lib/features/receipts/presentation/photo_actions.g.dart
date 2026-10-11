// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PhotoFilterController)
final photoFilterControllerProvider = PhotoFilterControllerProvider._();

final class PhotoFilterControllerProvider
    extends $NotifierProvider<PhotoFilterController, PhotoFilter> {
  PhotoFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoFilterControllerHash();

  @$internal
  @override
  PhotoFilterController create() => PhotoFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoFilter>(value),
    );
  }
}

String _$photoFilterControllerHash() =>
    r'5c474857fa1700ccba0c96c56952189afb4967f1';

abstract class _$PhotoFilterController extends $Notifier<PhotoFilter> {
  PhotoFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PhotoFilter, PhotoFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PhotoFilter, PhotoFilter>,
              PhotoFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(photoActions)
final photoActionsProvider = PhotoActionsProvider._();

final class PhotoActionsProvider
    extends $FunctionalProvider<PhotoActions, PhotoActions, PhotoActions>
    with $Provider<PhotoActions> {
  PhotoActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoActionsHash();

  @$internal
  @override
  $ProviderElement<PhotoActions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PhotoActions create(Ref ref) {
    return photoActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoActions>(value),
    );
  }
}

String _$photoActionsHash() => r'a9c71ade7c4064c95fc4d1acb2b262b5a6460eeb';
