import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

enum AlertSensitivity { low, normal, high }

const supportedLanguageCodes = ['fr', 'en'];

const defaultLanguageCode = 'fr';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(defaultLanguageCode) String languageCode,
    @Default(AlertSensitivity.normal) AlertSensitivity alertSensitivity,
  }) = _AppSettings;
}

abstract interface class SettingsRepository {
  Stream<AppSettings> watch();

  Future<AppSettings> get();

  Future<void> setLanguage(String languageCode);

  Future<void> setAlertSensitivity(AlertSensitivity sensitivity);
}
