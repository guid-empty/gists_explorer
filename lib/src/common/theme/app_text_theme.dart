import 'dart:ui' as ui show Shadow, FontFeature;

import 'package:flutter/material.dart';
import 'package:gists_explorer/src/common/theme/app_theme_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme extends TextTheme {
  final AppThemeTextStyle subtitle1R;
  final AppThemeTextStyle subtitle1M;
  final AppThemeTextStyle caption1R;
  final AppThemeTextStyle caption1M;
  final AppThemeTextStyle headline4light;

  @override
  final AppThemeTextStyle headline1;
  @override
  final AppThemeTextStyle headline2;
  @override
  final AppThemeTextStyle headline3;
  @override
  final AppThemeTextStyle headline4;
  @override
  final AppThemeTextStyle headline5;
  @override
  final AppThemeTextStyle headline6;
  @override
  final AppThemeTextStyle subtitle2;
  @override
  final AppThemeTextStyle bodyText1;
  @override
  final AppThemeTextStyle bodyText2;
  @override
  final AppThemeTextStyle button;
  @override
  final AppThemeTextStyle overline;

  const AppTextTheme({
    this.subtitle1R,
    this.subtitle1M,
    this.caption1R,
    this.caption1M,
    this.headline1,
    this.headline2,
    this.headline3,
    this.headline4,
    this.headline4light,
    this.headline5,
    this.headline6,
    this.subtitle2,
    this.bodyText1,
    this.bodyText2,
    this.button,
    this.overline,
  }) : super(
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          headline5: headline5,
          headline6: headline6,
          subtitle1: subtitle1R,
          subtitle2: subtitle2,
          bodyText1: bodyText1,
          bodyText2: bodyText2,
          caption: caption1R,
          button: button,
          overline: overline,
        );

  factory AppTextTheme.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) =>
      AppTextTheme(
        headline1: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 96,
            height: 112 / 96,
            letterSpacing: -1.5,
          ),
        ),
        headline2: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 60,
            height: 72 / 60,
            letterSpacing: -.5,
          ),
        ),
        headline3: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 48,
            height: 56 / 48,
          ),
        ),
        headline4: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 34,
            height: 36 / 34,
          ),
        ),
        headline4light: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 34,
            height: 36 / 34,
          ),
        ),
        headline5: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 24,
            height: 1,
            letterSpacing: .18,
          ),
        ),
        headline6: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            height: 24 / 20,
            letterSpacing: .15,
          ),
        ),
        subtitle1R: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: .15,
          ),
        ),
        subtitle1M: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: .15,
          ),
        ),
        subtitle2: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            height: 24 / 14,
            letterSpacing: .1,
          ),
        ),
        bodyText1: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: .5,
          ),
        ),
        bodyText2: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: .25,
          ),
        ),
        button: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            height: 16 / 14,
            letterSpacing: 1.25,
          ),
        ),
        caption1R: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 12,
            height: 16 / 12,
            letterSpacing: .4,
          ),
        ),
        caption1M: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 12,
            height: 16 / 12,
            letterSpacing: .4,
          ),
        ),
        overline: AppThemeTextStyle(colorScheme).merge(
          GoogleFonts.roboto(
            color: colorScheme.onSurfaceHighEmphasis,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 10,
            height: 16 / 10,
            letterSpacing: 1.5,
          ),
        ),
      );
}

class AppThemeTextStyle extends TextStyle {
  final AppThemeColorScheme colorScheme;

  const AppThemeTextStyle(
    this.colorScheme, {
    bool inherit = true,
    Color color,
    Color backgroundColor,
    String fontFamily,
    List<String> fontFamilyFallback,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness,
    String debugLabel,
    List<ui.Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
  }) : super(
          inherit: inherit,
          color: color,
          backgroundColor: backgroundColor,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
          shadows: shadows,
          fontFeatures: fontFeatures,
        );

  ///
  /// Some problems with font weight are described here
  /// https://github.com/material-foundation/google-fonts-flutter/issues/141
  ///
  @override
  AppThemeTextStyle copyWith({
    bool inherit = true,
    Color color,
    Color backgroundColor,
    String fontFamily,
    List<String> fontFamilyFallback,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint foreground,
    Paint background,
    List<ui.Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    double decorationThickness,
    String debugLabel,
  }) {
    return AppThemeTextStyle(
      colorScheme,
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null
          ? color ?? this.color
          : null,
      backgroundColor: this.background == null && background == null
          ? backgroundColor ?? this.backgroundColor
          : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }

  @override
  AppThemeTextStyle merge(TextStyle other) {
    final merged = super.merge(other);

    return copyWith(
      inherit: merged.inherit,
      color: merged.color,
      backgroundColor: merged.backgroundColor,
      fontFamily: merged.fontFamily,
      fontFamilyFallback: merged.fontFamilyFallback,
      fontSize: merged.fontSize,
      fontWeight: merged.fontWeight,
      fontStyle: merged.fontStyle,
      letterSpacing: merged.letterSpacing,
      wordSpacing: merged.wordSpacing,
      textBaseline: merged.textBaseline,
      height: merged.height,
      locale: merged.locale,
      foreground: merged.foreground,
      background: merged.background,
      shadows: merged.shadows,
      fontFeatures: merged.fontFeatures,
      decoration: merged.decoration,
      decorationColor: merged.decorationColor,
      decorationStyle: merged.decorationStyle,
      decorationThickness: merged.decorationThickness,
      debugLabel: merged.debugLabel,
    );
  }
}
