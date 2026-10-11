// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_viewer_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(photoById)
final photoByIdProvider = PhotoByIdFamily._();

final class PhotoByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ReceiptPhoto?>,
          ReceiptPhoto?,
          FutureOr<ReceiptPhoto?>
        >
    with $FutureModifier<ReceiptPhoto?>, $FutureProvider<ReceiptPhoto?> {
  PhotoByIdProvider._({
    required PhotoByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'photoByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$photoByIdHash();

  @override
  String toString() {
    return r'photoByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ReceiptPhoto?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ReceiptPhoto?> create(Ref ref) {
    final argument = this.argument as String;
    return photoById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotoByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$photoByIdHash() => r'cf53ed51f4d2d4a994dc55a1d4941566eba6d14c';

final class PhotoByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ReceiptPhoto?>, String> {
  PhotoByIdFamily._()
    : super(
        retry: null,
        name: r'photoByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PhotoByIdProvider call(String id) =>
      PhotoByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'photoByIdProvider';
}
