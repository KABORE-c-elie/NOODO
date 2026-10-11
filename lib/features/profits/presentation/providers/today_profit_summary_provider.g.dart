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
    r'3c29c00ce867b2f879d8567e0b7b94db4b88d7e7';
