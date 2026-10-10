import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _seed = Color(0xFFE8711A);

  static ThemeData get light =>
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed));

  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.dark,
    ),
  );
}
