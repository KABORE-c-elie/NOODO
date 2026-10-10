import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
Locale appLocale(Ref ref) => const Locale('fr');
