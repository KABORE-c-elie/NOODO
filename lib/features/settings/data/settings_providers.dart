import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    DriftSettingsRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
Stream<AppSettings> settings(Ref ref) =>
    ref.watch(settingsRepositoryProvider).watch();

@Riverpod(keepAlive: true)
Locale appLocale(Ref ref) => Locale(
  ref.watch(settingsProvider.select((s) => s.value?.languageCode)) ??
      defaultLanguageCode,
);

@Riverpod(keepAlive: true)
AlertSensitivity alertSensitivity(Ref ref) =>
    ref.watch(settingsProvider.select((s) => s.value?.alertSensitivity)) ??
    AlertSensitivity.normal;

@Riverpod(keepAlive: true)
AppThemeMode appThemeMode(Ref ref) =>
    ref.watch(settingsProvider.select((s) => s.value?.themeMode)) ??
    AppThemeMode.system;
