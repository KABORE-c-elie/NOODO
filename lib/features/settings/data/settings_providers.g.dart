// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'0eda22c9c7a5e68c8661bf58b528d73264ef9a19';

@ProviderFor(settings)
final settingsProvider = SettingsProvider._();

final class SettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppSettings>,
          AppSettings,
          Stream<AppSettings>
        >
    with $FutureModifier<AppSettings>, $StreamProvider<AppSettings> {
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  $StreamProviderElement<AppSettings> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AppSettings> create(Ref ref) {
    return settings(ref);
  }
}

String _$settingsHash() => r'3b6219f1439e57bfda762caba6bd092e11961fb0';

@ProviderFor(appLocale)
final appLocaleProvider = AppLocaleProvider._();

final class AppLocaleProvider
    extends $FunctionalProvider<Locale, Locale, Locale>
    with $Provider<Locale> {
  AppLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocaleHash();

  @$internal
  @override
  $ProviderElement<Locale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Locale create(Ref ref) {
    return appLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$appLocaleHash() => r'0bc64c8b31d55d1d75a88126292ab52d58946028';

@ProviderFor(alertSensitivity)
final alertSensitivityProvider = AlertSensitivityProvider._();

final class AlertSensitivityProvider
    extends
        $FunctionalProvider<
          AlertSensitivity,
          AlertSensitivity,
          AlertSensitivity
        >
    with $Provider<AlertSensitivity> {
  AlertSensitivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alertSensitivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alertSensitivityHash();

  @$internal
  @override
  $ProviderElement<AlertSensitivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AlertSensitivity create(Ref ref) {
    return alertSensitivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlertSensitivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlertSensitivity>(value),
    );
  }
}

String _$alertSensitivityHash() => r'bf3a6aaa8bd2347f91f716f7dd1a9c7baf6da425';
