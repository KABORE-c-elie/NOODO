// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profits_period_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfitsPeriodController)
final profitsPeriodControllerProvider = ProfitsPeriodControllerProvider._();

final class ProfitsPeriodControllerProvider
    extends $NotifierProvider<ProfitsPeriodController, ProfitsPeriod> {
  ProfitsPeriodControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profitsPeriodControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profitsPeriodControllerHash();

  @$internal
  @override
  ProfitsPeriodController create() => ProfitsPeriodController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfitsPeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfitsPeriod>(value),
    );
  }
}

String _$profitsPeriodControllerHash() =>
    r'dac3be2eed27cbd9b6b7e6d8ea17c90b9d6f2167';

abstract class _$ProfitsPeriodController extends $Notifier<ProfitsPeriod> {
  ProfitsPeriod build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProfitsPeriod, ProfitsPeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfitsPeriod, ProfitsPeriod>,
              ProfitsPeriod,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
