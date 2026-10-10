// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profitReport)
final profitReportProvider = ProfitReportProvider._();

final class ProfitReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProfitReport>,
          ProfitReport,
          Stream<ProfitReport>
        >
    with $FutureModifier<ProfitReport>, $StreamProvider<ProfitReport> {
  ProfitReportProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profitReportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profitReportHash();

  @$internal
  @override
  $StreamProviderElement<ProfitReport> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<ProfitReport> create(Ref ref) {
    return profitReport(ref);
  }
}

String _$profitReportHash() => r'd3e2b77f006f1ce9db4f82bb8683726013cef6fb';
