// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_net_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dayNet)
final dayNetProvider = DayNetFamily._();

final class DayNetProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  DayNetProvider._({
    required DayNetFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'dayNetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dayNetHash();

  @override
  String toString() {
    return r'dayNetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    final argument = this.argument as DateTime;
    return dayNet(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DayNetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dayNetHash() => r'b4d0caa22df3bd608a6fd653eeac58f4aa519e86';

final class DayNetFamily extends $Family
    with $FunctionalFamilyOverride<Stream<int>, DateTime> {
  DayNetFamily._()
    : super(
        retry: null,
        name: r'dayNetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DayNetProvider call(DateTime day) =>
      DayNetProvider._(argument: day, from: this);

  @override
  String toString() => r'dayNetProvider';
}
