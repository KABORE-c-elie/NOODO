import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/database/app_database.dart';
import 'package:noodo/core/database/database_provider.dart';
import 'package:noodo/features/settings/data/drift_settings_repository.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';

import '../../helpers/fixtures.dart';

void main() {
  late AppDatabase db;
  late DriftSettingsRepository repository;

  setUp(() {
    db = createMemoryDatabase();
    repository = DriftSettingsRepository(db);
  });

  tearDown(() => db.close());

  test('valeurs par défaut : français, sensibilité normale', () async {
    expect(await repository.get(), const AppSettings());
    expect((await repository.get()).languageCode, 'fr');
  });

  test('changer la langue et la sensibilité', () async {
    await repository.setLanguage('en');
    await repository.setAlertSensitivity(AlertSensitivity.high);

    expect(
      await repository.get(),
      const AppSettings(
        languageCode: 'en',
        alertSensitivity: AlertSensitivity.high,
      ),
    );
  });

  test('langue non prise en charge refusée', () {
    expect(() => repository.setLanguage('de'), throwsArgumentError);
  });

  test('les providers suivent les réglages stockés', () async {
    final container = ProviderContainer.test(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
    );
    container
      ..listen(appLocaleProvider, (_, _) {})
      ..listen(alertSensitivityProvider, (_, _) {});
    await container.read(settingsProvider.future);
    expect(container.read(appLocaleProvider), const Locale('fr'));

    await repository.setLanguage('en');
    await repository.setAlertSensitivity(AlertSensitivity.low);
    await pumpEventQueue();

    expect(container.read(appLocaleProvider), const Locale('en'));
    expect(container.read(alertSensitivityProvider), AlertSensitivity.low);
  });
}
