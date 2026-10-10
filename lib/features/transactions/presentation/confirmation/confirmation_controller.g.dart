// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConfirmationController)
final confirmationControllerProvider = ConfirmationControllerProvider._();

final class ConfirmationControllerProvider
    extends $NotifierProvider<ConfirmationController, TransactionDraft> {
  ConfirmationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'confirmationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$confirmationControllerHash();

  @$internal
  @override
  ConfirmationController create() => ConfirmationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionDraft>(value),
    );
  }
}

String _$confirmationControllerHash() =>
    r'cee30f57e3833d873f59690355c1ef496297c5f6';

abstract class _$ConfirmationController extends $Notifier<TransactionDraft> {
  TransactionDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TransactionDraft, TransactionDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransactionDraft, TransactionDraft>,
              TransactionDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
