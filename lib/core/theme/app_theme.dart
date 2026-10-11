import 'package:flutter/material.dart';
import 'package:noodo/core/theme/app_colors.dart';
import 'package:noodo/core/theme/app_spacing.dart';

const appFontFamily = 'Nunito';

const tabularFigures = [FontFeature.tabularFigures()];

abstract final class AppTheme {
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFA9440B),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDBC8),
    onPrimaryContainer: Color(0xFF371100),
    secondary: Color(0xFF735848),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF7DCCC),
    onSecondaryContainer: Color(0xFF2B160A),
    tertiary: Color(0xFF5E6130),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE4E6A9),
    onTertiaryContainer: Color(0xFF1B1D00),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
    surface: Color(0xFFFFF8F4),
    onSurface: Color(0xFF231A15),
    surfaceDim: Color(0xFFE8D7CE),
    surfaceBright: Color(0xFFFFF8F4),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFFFF1EA),
    surfaceContainer: Color(0xFFFCEBE2),
    surfaceContainerHigh: Color(0xFFF6E5DC),
    surfaceContainerHighest: Color(0xFFF0DFD6),
    onSurfaceVariant: Color(0xFF53443B),
    outline: Color(0xFF85736A),
    outlineVariant: Color(0xFFD8C2B7),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF392E29),
    onInverseSurface: Color(0xFFFFEDE5),
    inversePrimary: Color(0xFFFFB68D),
  );

  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFF2AE85),
    onPrimary: Color(0xFF4F2108),
    primaryContainer: Color(0xFF6B3417),
    onPrimaryContainer: Color(0xFFFFDBC8),
    secondary: Color(0xFFE2C0AD),
    onSecondary: Color(0xFF412B1E),
    secondaryContainer: Color(0xFF594133),
    onSecondaryContainer: Color(0xFFFFDBC8),
    tertiary: Color(0xFFC8CA8F),
    onTertiary: Color(0xFF303206),
    tertiaryContainer: Color(0xFF46491B),
    onTertiaryContainer: Color(0xFFE4E6A9),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    surface: Color(0xFF1B1411),
    onSurface: Color(0xFFF0E1D9),
    surfaceDim: Color(0xFF1B1411),
    surfaceBright: Color(0xFF433934),
    surfaceContainerLowest: Color(0xFF150F0C),
    surfaceContainerLow: Color(0xFF231C18),
    surfaceContainer: Color(0xFF28201C),
    surfaceContainerHigh: Color(0xFF332A26),
    surfaceContainerHighest: Color(0xFF3E3530),
    onSurfaceVariant: Color(0xFFD8C2B7),
    outline: Color(0xFFA08D83),
    outlineVariant: Color(0xFF53443B),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFF0E1D9),
    onInverseSurface: Color(0xFF392E29),
    inversePrimary: Color(0xFFA9440B),
  );

  static ThemeData get light => _build(lightScheme, AppColors.light);

  static ThemeData get dark => _build(darkScheme, AppColors.dark);

  static TextTheme _textTheme(ColorScheme scheme) {
    final base =
        Typography.material2021(
          platform: TargetPlatform.android,
          colorScheme: scheme,
        ).englishLike.merge(
          scheme.brightness == Brightness.dark
              ? Typography.whiteMountainView
              : Typography.blackMountainView,
        );
    TextStyle? weight(TextStyle? style, FontWeight value) =>
        style?.copyWith(fontWeight: value, fontFamily: appFontFamily);
    return base
        .copyWith(
          displaySmall: weight(base.displaySmall, FontWeight.w800),
          headlineLarge: weight(base.headlineLarge, FontWeight.w800),
          headlineMedium: weight(base.headlineMedium, FontWeight.w800),
          headlineSmall: weight(base.headlineSmall, FontWeight.w700),
          titleLarge: weight(base.titleLarge, FontWeight.w800),
          titleMedium: weight(base.titleMedium, FontWeight.w700),
          titleSmall: weight(base.titleSmall, FontWeight.w700),
          bodyLarge: weight(
            base.bodyLarge?.copyWith(fontSize: 17),
            FontWeight.w400,
          ),
          bodyMedium: weight(
            base.bodyMedium?.copyWith(fontSize: 15),
            FontWeight.w400,
          ),
          bodySmall: weight(base.bodySmall, FontWeight.w400),
          labelLarge: weight(base.labelLarge, FontWeight.w700),
          labelMedium: weight(base.labelMedium, FontWeight.w700),
          labelSmall: weight(base.labelSmall, FontWeight.w600),
        )
        .apply(
          bodyColor: scheme.onSurface,
          displayColor: scheme.onSurface,
          fontFamily: appFontFamily,
        );
  }

  static ThemeData _build(ColorScheme scheme, AppColors colors) {
    final text = _textTheme(scheme);
    final mediumShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );
    const buttonSize = Size(64, 52);
    final buttonText = text.labelLarge;
    OutlineInputBorder inputBorder(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: appFontFamily,
      textTheme: text,
      scaffoldBackgroundColor: scheme.surface,
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 1,
        titleTextStyle: text.titleLarge,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonSize,
          shape: mediumShape,
          textStyle: buttonText,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonSize,
          shape: mediumShape,
          textStyle: buttonText,
          side: BorderSide(color: scheme.outline),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: mediumShape,
          textStyle: buttonText,
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          minimumSize: const Size(0, 48),
          selectedBackgroundColor: scheme.secondaryContainer,
          selectedForegroundColor: scheme.onSecondaryContainer,
          side: BorderSide(color: scheme.outline),
          textStyle: buttonText,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        elevation: 2,
        extendedTextStyle: buttonText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md + AppSpacing.xxs,
        ),
        border: inputBorder(scheme.outline),
        enabledBorder: inputBorder(scheme.outlineVariant),
        focusedBorder: inputBorder(scheme.primary, 2),
        errorBorder: inputBorder(scheme.error),
        focusedErrorBorder: inputBorder(scheme.error, 2),
        labelStyle: text.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
        helperStyle: text.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        errorStyle: text.bodySmall?.copyWith(
          color: scheme.error,
          fontWeight: FontWeight.w700,
        ),
      ),
      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        side: BorderSide(color: scheme.outlineVariant),
        backgroundColor: scheme.surfaceContainerLow,
        selectedColor: scheme.secondaryContainer,
        labelStyle: text.labelLarge?.copyWith(color: scheme.onSurface),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.primaryContainer,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStatePropertyAll(
          text.labelMedium?.copyWith(color: scheme.onSurface),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: scheme.outline,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        titleTextStyle: text.titleLarge,
        contentTextStyle: text.bodyLarge,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: text.bodyMedium?.copyWith(
          color: scheme.onInverseSurface,
        ),
        actionTextColor: scheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        titleTextStyle: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        subtitleTextStyle: text.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, space: 1),
    );
  }
}
