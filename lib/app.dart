import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/features/settings/data/settings_providers.dart';
import 'package:noodo/features/settings/domain/app_settings.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_router.dart';
import 'package:noodo/core/theme/app_theme.dart';
import 'package:noodo/core/utils/day_refresher.dart';
import 'package:noodo/features/nodes/presentation/reminder_sync.dart';

class NoodoApp extends ConsumerWidget {
  const NoodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reminderSyncProvider);
    return DayRefresher(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: switch (ref.watch(appThemeModeProvider)) {
          AppThemeMode.system => ThemeMode.system,
          AppThemeMode.light => ThemeMode.light,
          AppThemeMode.dark => ThemeMode.dark,
        },
        locale: ref.watch(appLocaleProvider),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: ref.watch(appRouterProvider),
      ),
    );
  }
}
