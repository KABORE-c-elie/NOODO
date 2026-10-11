// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speech_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(speechService)
final speechServiceProvider = SpeechServiceProvider._();

final class SpeechServiceProvider
    extends $FunctionalProvider<SpeechService, SpeechService, SpeechService>
    with $Provider<SpeechService> {
  SpeechServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'speechServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$speechServiceHash();

  @$internal
  @override
  $ProviderElement<SpeechService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SpeechService create(Ref ref) {
    return speechService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SpeechService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SpeechService>(value),
    );
  }
}

String _$speechServiceHash() => r'22d76a3000e2deb5782cb3e1e435f4a99be4e246';
