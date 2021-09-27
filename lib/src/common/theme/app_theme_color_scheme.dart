import 'package:flutter/material.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  static _LightColorScheme light = _LightColorScheme();
  static _DarkColorScheme dark = _DarkColorScheme();

  final _GrayscaleSubColorScheme grayScale;
  final _ColorFullSubColorScheme colorFull;
  final _BackgroundSubColorScheme backgroundScheme;

  final Brightness _brightness;

  AppThemeColorScheme({
    required Color backgroundPrimary,
    required Color backgroundSecondary,
    required Color backgroundSecondaryVariant,
    required Color colorFullSchemePrimary,
    required Color colorFullSchemeSecondary,
    required Color colorFullSchemeSuccess,
    required Color colorFullSchemeWarning,
    required Color colorFullSchemeOnPrimary,
    required Color colorFullSchemeOnSecondary,
    required Color colorFullSchemeOnSuccess,
    required Color colorFullSchemeOnWarning,
    required Color grayScaleDark,
    required Color grayScaleMediumDark,
    required Color grayScaleMediumLight,
    required Color grayScaleLight,
    required Color grayScaleTransparentLight,
    required Color grayScaleOnDark,
    required Color grayScaleOnMediumDark,
    required Brightness brightness,
  })  : _brightness = brightness,
        colorFull = _ColorFullSubColorScheme(
          primary: colorFullSchemePrimary,
          secondary: colorFullSchemeSecondary,
          success: colorFullSchemeSuccess,
          warning: colorFullSchemeWarning,
          onPrimary: colorFullSchemeOnPrimary,
          onSecondary: colorFullSchemeOnSecondary,
          onSuccess: colorFullSchemeOnSuccess,
          onWarning: colorFullSchemeOnWarning,
        ),
        grayScale = _GrayscaleSubColorScheme(
          dark: grayScaleDark,
          mediumDark: grayScaleMediumDark,
          mediumLight: grayScaleMediumLight,
          light: grayScaleLight,
          transparentLight: grayScaleTransparentLight,
          onDark: grayScaleOnDark,
          onMediumDark: grayScaleOnMediumDark,
        ),
        backgroundScheme = _BackgroundSubColorScheme(
          primary: backgroundPrimary,
          secondary: backgroundSecondary,
          secondaryVariant: backgroundSecondaryVariant,
        ),
        super(
          primary: backgroundPrimary,
          primaryVariant: backgroundPrimary,
          secondary: backgroundSecondary,
          secondaryVariant: backgroundSecondary,
          surface: backgroundPrimary,
          background: backgroundPrimary,
          error: colorFullSchemeWarning,
          onPrimary: grayScaleOnDark,
          onSecondary: grayScaleOnDark,
          onSurface: grayScaleOnDark,
          onBackground: grayScaleOnDark,
          onError: colorFullSchemeOnWarning,
          brightness: brightness,
        );

  @override
  Color get background => backgroundScheme.primary;
  @override
  Brightness get brightness => _brightness;
  @override
  Color get error => colorFull.warning;
  @override
  Color get onBackground => grayScale.onDark;
  @override
  Color get onError => colorFull.onWarning;
  @override
  Color get onPrimary => grayScale.onDark;
  @override
  Color get onSecondary => grayScale.onDark;
  @override
  Color get onSurface => grayScale.onDark;
  @override
  Color get primary => backgroundScheme.primary;
  @override
  Color get primaryVariant => backgroundScheme.primary;
  @override
  Color get secondary => backgroundScheme.secondary;
  @override
  Color get secondaryVariant => backgroundScheme.secondaryVariant;
  @override
  Color get surface => backgroundScheme.primary;
}

class _BackgroundSubColorScheme {
  final Color primary;
  final Color secondary;
  final Color secondaryVariant;

  const _BackgroundSubColorScheme({
    required this.primary,
    required this.secondary,
    required this.secondaryVariant,
  });
}

class _ColorFullSubColorScheme {
  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSuccess;
  final Color onWarning;

  _ColorFullSubColorScheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.onPrimary,
    required this.onSecondary,
    required this.onSuccess,
    required this.onWarning,
  });
}

class _DarkColorScheme extends AppThemeColorScheme {
  _DarkColorScheme()
      : super(
          brightness: Brightness.dark,
          backgroundPrimary: const Color(0xFF1F1E21),
          backgroundSecondary: const Color(0xE5242327),
          backgroundSecondaryVariant: const Color(0xB2151515),
          colorFullSchemePrimary: const Color(0xFF00A4FF),
          colorFullSchemeSecondary: const Color(0xFFF2C94C),
          colorFullSchemeSuccess: const Color(0xFF27AE60),
          colorFullSchemeWarning: const Color(0xFFEB5757),
          colorFullSchemeOnPrimary: const Color(0xFFFFFFFF),
          colorFullSchemeOnSecondary: const Color(0xFF333333),
          colorFullSchemeOnSuccess: const Color(0xFFFFFFFF),
          colorFullSchemeOnWarning: const Color(0xFFFFFFFF),
          grayScaleDark: const Color(0xFF333333),
          grayScaleMediumDark: const Color(0xFF4F4F4F),
          grayScaleMediumLight: const Color(0xFF828282),
          grayScaleLight: const Color(0xFFFFFFFF),
          grayScaleTransparentLight: const Color(0x19FFFFFF),
          grayScaleOnDark: const Color(0xFFFFFFFF),
          grayScaleOnMediumDark: const Color(0xFFFFFFFF),
        );
}

class _GrayscaleSubColorScheme {
  final Color dark;
  final Color mediumDark;
  final Color mediumLight;
  final Color light;
  final Color transparentLight;
  final Color onDark;
  final Color onMediumDark;

  const _GrayscaleSubColorScheme({
    required this.dark,
    required this.mediumDark,
    required this.mediumLight,
    required this.light,
    required this.transparentLight,
    required this.onDark,
    required this.onMediumDark,
  });
}

class _LightColorScheme extends AppThemeColorScheme {
  _LightColorScheme()
      : super(
          brightness: Brightness.dark,
          backgroundPrimary: const Color(0xFF1F1E21),
          backgroundSecondary: const Color(0xE5242327),
          backgroundSecondaryVariant: const Color(0xB2151515),
          colorFullSchemePrimary: const Color(0xFF00A4FF),
          colorFullSchemeSecondary: const Color(0xFFF2C94C),
          colorFullSchemeSuccess: const Color(0xFF27AE60),
          colorFullSchemeWarning: const Color(0xFFEB5757),
          colorFullSchemeOnPrimary: const Color(0xFFFFFFFF),
          colorFullSchemeOnSecondary: const Color(0xFF333333),
          colorFullSchemeOnSuccess: const Color(0xFFFFFFFF),
          colorFullSchemeOnWarning: const Color(0xFFFFFFFF),
          grayScaleDark: const Color(0xFF333333),
          grayScaleMediumDark: const Color(0xFF4F4F4F),
          grayScaleMediumLight: const Color(0xFF828282),
          grayScaleLight: const Color(0xFFFFFFFF),
          grayScaleTransparentLight: const Color(0x19FFFFFF),
          grayScaleOnDark: const Color(0xFFFFFFFF),
          grayScaleOnMediumDark: const Color(0xFFFFFFFF),
        );
}
