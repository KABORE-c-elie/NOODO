// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nodeRepository)
final nodeRepositoryProvider = NodeRepositoryProvider._();

final class NodeRepositoryProvider
    extends $FunctionalProvider<NodeRepository, NodeRepository, NodeRepository>
    with $Provider<NodeRepository> {
  NodeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeRepositoryHash();

  @$internal
  @override
  $ProviderElement<NodeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NodeRepository create(Ref ref) {
    return nodeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeRepository>(value),
    );
  }
}

String _$nodeRepositoryHash() => r'cb1ea8332eeea7ee41cab8293b2fe0e6cbe1048d';
