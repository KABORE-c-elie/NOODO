import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noodo/core/theme/app_colors.dart';
import 'package:noodo/core/theme/app_theme.dart';

const _normalText = 4.5;

double _luminance(Color color) {
  double channel(double value) => value <= 0.03928
      ? value / 12.92
      : pow((value + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * channel(color.r) +
      0.7152 * channel(color.g) +
      0.0722 * channel(color.b);
}

double contrast(Color a, Color b) {
  final la = _luminance(a);
  final lb = _luminance(b);
  return (max(la, lb) + 0.05) / (min(la, lb) + 0.05);
}

void main() {
  for (final (name, scheme, colors) in [
    ('clair', AppTheme.lightScheme, AppColors.light),
    ('sombre', AppTheme.darkScheme, AppColors.dark),
  ]) {
    group('thème $name : contraste WCAG AA', () {
      final backgrounds = {
        'surface': scheme.surface,
        'surfaceContainerLow': scheme.surfaceContainerLow,
        'surfaceContainer': scheme.surfaceContainer,
        'surfaceContainerHigh': scheme.surfaceContainerHigh,
      };

      for (final (label, foreground) in [
        ('texte principal', scheme.onSurface),
        ('texte secondaire', scheme.onSurfaceVariant),
        ('vente', colors.sale),
        ('dépense', colors.expense),
        ('épargne', colors.savings),
        ('alerte', colors.alert),
        ('primaire', scheme.primary),
        ('erreur', scheme.error),
      ]) {
        for (final MapEntry(key: background, value: color)
            in backgrounds.entries) {
          test('$label sur $background', () {
            expect(
              contrast(foreground, color),
              greaterThanOrEqualTo(_normalText),
            );
          });
        }
      }

      for (final (label, foreground, background) in [
        ('bouton principal', scheme.onPrimary, scheme.primary),
        (
          'conteneur primaire',
          scheme.onPrimaryContainer,
          scheme.primaryContainer,
        ),
        (
          'conteneur secondaire',
          scheme.onSecondaryContainer,
          scheme.secondaryContainer,
        ),
        ('conteneur erreur', scheme.onErrorContainer, scheme.errorContainer),
        ('SnackBar', scheme.onInverseSurface, scheme.inverseSurface),
        ('carte vente', colors.onSaleContainer, colors.saleContainer),
        ('carte dépense', colors.onExpenseContainer, colors.expenseContainer),
        ('carte épargne', colors.onSavingsContainer, colors.savingsContainer),
        ('carte alerte', colors.onAlertContainer, colors.alertContainer),
        ('champ de saisie', scheme.onSurface, scheme.surfaceContainerLowest),
      ]) {
        test(label, () {
          expect(
            contrast(foreground, background),
            greaterThanOrEqualTo(_normalText),
          );
        });
      }
    });
  }

  test('le mode sombre a des fonds teintés chauds, pas un gris neutre', () {
    final surface = AppTheme.darkScheme.surface;
    expect(surface.r, greaterThan(surface.b));
    expect(
      AppTheme.lightScheme.surface.r,
      greaterThan(AppTheme.lightScheme.surface.b),
    );
  });

  test('l\'orange du mode sombre est moins saturé que celui du mode clair', () {
    final light = HSLColor.fromColor(AppTheme.lightScheme.primary);
    final dark = HSLColor.fromColor(AppTheme.darkScheme.primary);
    expect(dark.saturation, lessThan(light.saturation));
    expect(dark.lightness, greaterThan(light.lightness));
  });

  test('AppColors.lerp passe progressivement d\'un thème à l\'autre', () {
    expect(AppColors.light.lerp(AppColors.dark, 0).sale, AppColors.light.sale);
    expect(AppColors.light.lerp(AppColors.dark, 1).sale, AppColors.dark.sale);
    expect(
      AppColors.light.lerp(AppColors.dark, 0.5).sale,
      Color.lerp(AppColors.light.sale, AppColors.dark.sale, 0.5),
    );
    expect(
      AppColors.light.copyWith(sale: Colors.black).expense,
      AppColors.light.expense,
    );
  });
}
