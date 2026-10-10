// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_profit_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todayProfitSummary)
final todayProfitSummaryProvider = TodayProfitSummaryProvider._();

final class TodayProfitSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfitSummary>,
          ProfitSummary,
          Stream<ProfitSummary>
        >
    with $FutureModifier<ProfitSummary>, $StreamProvider<ProfitSummary> {
  TodayProfitSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayProfitSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayProfitSummaryHash();

  @$internal
  @override
  $StreamProviderElement<ProfitSummary> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProfitSummary> create(Ref ref) {
    return todayProfitSummary(ref);
  }
}

String _$todayProfitSummaryHash() =>
    r'e3722e494c10db01fbb5c732d2adc0e0f91d323a';
