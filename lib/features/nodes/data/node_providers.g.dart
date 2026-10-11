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

@ProviderFor(receiptSharer)
final receiptSharerProvider = ReceiptSharerProvider._();

final class ReceiptSharerProvider
    extends $FunctionalProvider<ReceiptSharer, ReceiptSharer, ReceiptSharer>
    with $Provider<ReceiptSharer> {
  ReceiptSharerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'receiptSharerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$receiptSharerHash();

  @$internal
  @override
  $ProviderElement<ReceiptSharer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReceiptSharer create(Ref ref) {
    return receiptSharer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiptSharer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiptSharer>(value),
    );
  }
}

String _$receiptSharerHash() => r'decdc4f5efb465b3a9d616f7e3bda68e67a3495b';

@ProviderFor(taxNode)
final taxNodeProvider = TaxNodeProvider._();

final class TaxNodeProvider
    extends $FunctionalProvider<AsyncValue<TaxNode>, TaxNode, Stream<TaxNode>>
    with $FutureModifier<TaxNode>, $StreamProvider<TaxNode> {
  TaxNodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taxNodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taxNodeHash();

  @$internal
  @override
  $StreamProviderElement<TaxNode> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<TaxNode> create(Ref ref) {
    return taxNode(ref);
  }
}

String _$taxNodeHash() => r'c05305d714e2f62354a5571f0abfb5d85236d6b0';

@ProviderFor(creditors)
final creditorsProvider = CreditorsProvider._();

final class CreditorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CreditorNode>>,
          List<CreditorNode>,
          Stream<List<CreditorNode>>
        >
    with
        $FutureModifier<List<CreditorNode>>,
        $StreamProvider<List<CreditorNode>> {
  CreditorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'creditorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$creditorsHash();

  @$internal
  @override
  $StreamProviderElement<List<CreditorNode>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CreditorNode>> create(Ref ref) {
    return creditors(ref);
  }
}

String _$creditorsHash() => r'ada2ade49bb2c8cf71bff579af3fefe091d39367';

@ProviderFor(creditor)
final creditorProvider = CreditorFamily._();

final class CreditorProvider
    extends
        $FunctionalProvider<
          AsyncValue<CreditorNode?>,
          CreditorNode?,
          Stream<CreditorNode?>
        >
    with $FutureModifier<CreditorNode?>, $StreamProvider<CreditorNode?> {
  CreditorProvider._({
    required CreditorFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'creditorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$creditorHash();

  @override
  String toString() {
    return r'creditorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<CreditorNode?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CreditorNode?> create(Ref ref) {
    final argument = this.argument as String;
    return creditor(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreditorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$creditorHash() => r'e5336a1abdff3261a7389c11a9a047adf5a04027';

final class CreditorFamily extends $Family
    with $FunctionalFamilyOverride<Stream<CreditorNode?>, String> {
  CreditorFamily._()
    : super(
        retry: null,
        name: r'creditorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreditorProvider call(String id) =>
      CreditorProvider._(argument: id, from: this);

  @override
  String toString() => r'creditorProvider';
}

@ProviderFor(creditorPayments)
final creditorPaymentsProvider = CreditorPaymentsFamily._();

final class CreditorPaymentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CreditorPayment>>,
          List<CreditorPayment>,
          Stream<List<CreditorPayment>>
        >
    with
        $FutureModifier<List<CreditorPayment>>,
        $StreamProvider<List<CreditorPayment>> {
  CreditorPaymentsProvider._({
    required CreditorPaymentsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'creditorPaymentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$creditorPaymentsHash();

  @override
  String toString() {
    return r'creditorPaymentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<CreditorPayment>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CreditorPayment>> create(Ref ref) {
    final argument = this.argument as String;
    return creditorPayments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreditorPaymentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$creditorPaymentsHash() => r'e63b49a7ba74ea64145132cc8cd75a45f7063245';

final class CreditorPaymentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<CreditorPayment>>, String> {
  CreditorPaymentsFamily._()
    : super(
        retry: null,
        name: r'creditorPaymentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreditorPaymentsProvider call(String creditorId) =>
      CreditorPaymentsProvider._(argument: creditorId, from: this);

  @override
  String toString() => r'creditorPaymentsProvider';
}
