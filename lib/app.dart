import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noodo/core/l10n/generated/app_localizations.dart';
import 'package:noodo/core/router/app_router.dart';
import 'package:noodo/core/theme/app_theme.dart';

class NoodoApp extends ConsumerWidget {
  const NoodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: const Locale('fr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: ref.watch(appRouterProvider),
    );
  }
}
