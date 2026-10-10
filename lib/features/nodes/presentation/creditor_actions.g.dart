// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(creditorActions)
final creditorActionsProvider = CreditorActionsProvider._();

final class CreditorActionsProvider
    extends
        $FunctionalProvider<CreditorActions, CreditorActions, CreditorActions>
    with $Provider<CreditorActions> {
  CreditorActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'creditorActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$creditorActionsHash();

  @$internal
  @override
  $ProviderElement<CreditorActions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreditorActions create(Ref ref) {
    return creditorActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreditorActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreditorActions>(value),
    );
  }
}

String _$creditorActionsHash() => r'054e043e5b986cc2f3fa71782669c393003089ff';
