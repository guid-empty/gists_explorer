import 'package:flutter/material.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  static const _LightColorScheme light = _LightColorScheme();
  static const _DarkColorScheme dark = _DarkColorScheme();

  @override
  final Color primary;
  @override
  final Color primaryVariant;
  @override
  final Color secondary;
  @override
  final Color surface;
  @override
  final Color background;
  @override
  final Color error;

  final Color green;
  final Color onPrimaryDisabled;
  final Color onPrimaryHighEmphasis;
  final Color onPrimaryMediumEmphasis;
  final Color onSurfaceDisabled;
  final Color onSurfaceHighEmphasis;
  final Color onSurfaceMediumEmphasis;
  final Color outline;
  final Color surfaceOverlay;
  final Color uiOverlay;

  @override
  final Brightness brightness;

  const AppThemeColorScheme({
    @required this.primary,
    @required this.primaryVariant,
    @required this.secondary,
    @required this.surface,
    @required this.background,
    @required this.error,
    @required this.brightness,
    @required this.green,
    @required this.onPrimaryDisabled,
    @required this.onPrimaryHighEmphasis,
    @required this.onPrimaryMediumEmphasis,
    @required this.onSurfaceDisabled,
    @required this.onSurfaceHighEmphasis,
    @required this.onSurfaceMediumEmphasis,
    @required this.outline,
    @required this.surfaceOverlay,
    @required this.uiOverlay,
  }) : super(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondary,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimaryHighEmphasis,
          onSecondary: onPrimaryHighEmphasis,
          onSurface: onSurfaceHighEmphasis,
          onBackground: onSurfaceHighEmphasis,
          onError: onPrimaryHighEmphasis,
          brightness: brightness,
        );
}

class _DarkColorScheme extends AppThemeColorScheme {
  const _DarkColorScheme()
      : super(
          brightness: Brightness.dark,
          primary: const Color(0xFF63B0FF),
          primaryVariant: const Color(0xFF1C48D9),
          secondary: const Color(0xFFDB7D0A),
          onPrimaryHighEmphasis: const Color(0xFF000000),
          background: const Color(0xFF1E2029),
          error: const Color(0xFFD85A6D),
          green: const Color(0xFF4DA85F),
          onPrimaryDisabled: const Color(0x61000000),
          onPrimaryMediumEmphasis: const Color(0xBD000000),
          onSurfaceDisabled: const Color(0x61FFFFFF),
          onSurfaceHighEmphasis: const Color(0xDEFFFFFF),
          onSurfaceMediumEmphasis: const Color(0x99FFFFFF),
          outline: const Color(0x1FFFFFFF),
          surface: const Color(0xFF1E2029),
          surfaceOverlay: const Color(0x15FFFFFF),
          uiOverlay: const Color(0x52000000),
        );
}

class _LightColorScheme extends AppThemeColorScheme {
  const _LightColorScheme()
      : super(
          brightness: Brightness.light,
          primary: const Color(0xFF1C48D9),
          primaryVariant: const Color(0xFF0035C2),
          secondary: const Color(0xFFDB7D0A),
          onPrimaryHighEmphasis: const Color(0xFFFFFFFF),
          background: const Color(0xFFFFFFFF),
          error: const Color(0xFFBB111F),
          green: const Color(0xFF15892B),
          onPrimaryDisabled: const Color(0x61FFFFFF),
          onPrimaryMediumEmphasis: const Color(0xBDFFFFFF),
          onSurfaceDisabled: const Color(0x61000000),
          onSurfaceHighEmphasis: const Color(0xDE000000),
          onSurfaceMediumEmphasis: const Color(0x99000000),
          outline: const Color(0x1F000000),
          surface: const Color(0xFFFFFFFF),
          surfaceOverlay: const Color(0x15242424),
          uiOverlay: const Color(0x52000000),
        );
}
