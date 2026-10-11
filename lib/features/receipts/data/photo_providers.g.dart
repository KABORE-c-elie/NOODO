// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(photoRepository)
final photoRepositoryProvider = PhotoRepositoryProvider._();

final class PhotoRepositoryProvider
    extends
        $FunctionalProvider<PhotoRepository, PhotoRepository, PhotoRepository>
    with $Provider<PhotoRepository> {
  PhotoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoRepositoryHash();

  @$internal
  @override
  $ProviderElement<PhotoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PhotoRepository create(Ref ref) {
    return photoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoRepository>(value),
    );
  }
}

String _$photoRepositoryHash() => r'e7cea498cb4cd8efa8dfd349cc0d303662d8071a';

@ProviderFor(photoStorage)
final photoStorageProvider = PhotoStorageProvider._();

final class PhotoStorageProvider
    extends
        $FunctionalProvider<
          AsyncValue<PhotoStorage>,
          PhotoStorage,
          FutureOr<PhotoStorage>
        >
    with $FutureModifier<PhotoStorage>, $FutureProvider<PhotoStorage> {
  PhotoStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoStorageHash();

  @$internal
  @override
  $FutureProviderElement<PhotoStorage> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PhotoStorage> create(Ref ref) {
    return photoStorage(ref);
  }
}

String _$photoStorageHash() => r'75f1c43cf76c71f6c0e71daa76eccfcf0ffd2981';

@ProviderFor(photos)
final photosProvider = PhotosFamily._();

final class PhotosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReceiptPhoto>>,
          List<ReceiptPhoto>,
          Stream<List<ReceiptPhoto>>
        >
    with
        $FutureModifier<List<ReceiptPhoto>>,
        $StreamProvider<List<ReceiptPhoto>> {
  PhotosProvider._({
    required PhotosFamily super.from,
    required PhotoQuery super.argument,
  }) : super(
         retry: null,
         name: r'photosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$photosHash();

  @override
  String toString() {
    return r'photosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<ReceiptPhoto>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ReceiptPhoto>> create(Ref ref) {
    final argument = this.argument as PhotoQuery;
    return photos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$photosHash() => r'd8ef3321910d66468e50bc7b926e6cc6bacedd8a';

final class PhotosFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<ReceiptPhoto>>, PhotoQuery> {
  PhotosFamily._()
    : super(
        retry: null,
        name: r'photosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PhotosProvider call(PhotoQuery query) =>
      PhotosProvider._(argument: query, from: this);

  @override
  String toString() => r'photosProvider';
}
