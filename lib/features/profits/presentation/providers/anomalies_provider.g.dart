// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anomalies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(anomalyDismissals)
final anomalyDismissalsProvider = AnomalyDismissalsProvider._();

final class AnomalyDismissalsProvider
    extends
        $FunctionalProvider<
          AnomalyDismissals,
          AnomalyDismissals,
          AnomalyDismissals
        >
    with $Provider<AnomalyDismissals> {
  AnomalyDismissalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'anomalyDismissalsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$anomalyDismissalsHash();

  @$internal
  @override
  $ProviderElement<AnomalyDismissals> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AnomalyDismissals create(Ref ref) {
    return anomalyDismissals(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnomalyDismissals value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnomalyDismissals>(value),
    );
  }
}

String _$anomalyDismissalsHash() => r'f63cf84f17cbcb5d86f16813c4e9eeb5a80465c1';

@ProviderFor(dismissedAnomalies)
final dismissedAnomaliesProvider = DismissedAnomaliesProvider._();

final class DismissedAnomaliesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<AnomalyType>>,
          Set<AnomalyType>,
          Stream<Set<AnomalyType>>
        >
    with $FutureModifier<Set<AnomalyType>>, $StreamProvider<Set<AnomalyType>> {
  DismissedAnomaliesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dismissedAnomaliesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dismissedAnomaliesHash();

  @$internal
  @override
  $StreamProviderElement<Set<AnomalyType>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<AnomalyType>> create(Ref ref) {
    return dismissedAnomalies(ref);
  }
}

String _$dismissedAnomaliesHash() =>
    r'6c67278601aa0e16a739bd682818f434205d8066';

@ProviderFor(anomalies)
final anomaliesProvider = AnomaliesProvider._();

final class AnomaliesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Anomaly>>,
          List<Anomaly>,
          Stream<List<Anomaly>>
        >
    with $FutureModifier<List<Anomaly>>, $StreamProvider<List<Anomaly>> {
  AnomaliesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'anomaliesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$anomaliesHash();

  @$internal
  @override
  $StreamProviderElement<List<Anomaly>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Anomaly>> create(Ref ref) {
    return anomalies(ref);
  }
}

String _$anomaliesHash() => r'3813a444a5db73743b58825220a2c0072cbe68aa';
