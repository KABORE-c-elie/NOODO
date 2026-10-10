// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_comparison_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todayComparison)
final todayComparisonProvider = TodayComparisonProvider._();

final class TodayComparisonProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfitComparison>,
          ProfitComparison,
          Stream<ProfitComparison>
        >
    with $FutureModifier<ProfitComparison>, $StreamProvider<ProfitComparison> {
  TodayComparisonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayComparisonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayComparisonHash();

  @$internal
  @override
  $StreamProviderElement<ProfitComparison> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProfitComparison> create(Ref ref) {
    return todayComparison(ref);
  }
}

String _$todayComparisonHash() => r'6ef7c2a03c0587783a050959f6d72308af3624b5';
