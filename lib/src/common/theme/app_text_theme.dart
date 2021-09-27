import 'dart:ui' as ui show Shadow, FontFeature;

import 'package:flutter/material.dart';
import 'package:gists_explorer/src/common/theme/app_theme_color_scheme.dart';

class AppTextTheme extends TextTheme {
  final AppThemeTextStyle bodyTextCaption;
  final AppThemeTextStyle bodyTextSubtitle;
  final AppThemeTextStyle bodyTextLargeBold;
  final AppThemeTextStyle bodyTextBaseSemibold;
  final AppThemeTextStyle bodyTextSmallBold;
  final AppThemeTextStyle bodyTextSmallSemibold;
  final AppThemeTextStyle bodyTextHelper;
  final AppThemeTextStyle buttonBase;
  final AppThemeTextStyle buttonSmall;
  final AppThemeTextStyle inputBase;
  final AppThemeTextStyle navigationBarBase;

  final AppThemeTextStyle _headline1;
  final AppThemeTextStyle _headline2;
  final AppThemeTextStyle _headline3;
  final AppThemeTextStyle _headline4;

  const AppTextTheme({
    required AppThemeTextStyle headline1,
    required AppThemeTextStyle headline2,
    required AppThemeTextStyle headline3,
    required AppThemeTextStyle headline4,
    required this.bodyTextSubtitle,
    required this.bodyTextLargeBold,
    required this.bodyTextBaseSemibold,
    required this.bodyTextSmallBold,
    required this.bodyTextSmallSemibold,
    required this.bodyTextHelper,
    required this.bodyTextCaption,
    required this.buttonBase,
    required this.buttonSmall,
    required this.inputBase,
    required this.navigationBarBase,
  })  : _headline1 = headline1,
        _headline2 = headline2,
        _headline3 = headline3,
        _headline4 = headline4,
        super(
          headline1: headline1,
          headline2: headline2,
          headline3: headline3,
          headline4: headline4,
          subtitle1: bodyTextSubtitle,
          subtitle2: bodyTextSubtitle,
          caption: bodyTextCaption,
          button: buttonBase,
        );
  factory AppTextTheme.byColorScheme(
    AppThemeColorScheme colorScheme,
  ) {
    return AppTextTheme(
      headline1: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 28,
          height: 32 / 28,
        ),
      ),
      headline2: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 26,
          height: 32 / 26,
        ),
      ),
      headline3: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 24,
          height: 28 / 24,
        ),
      ),
      headline4: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 24 / 20,
        ),
      ),
      bodyTextSubtitle: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 16 / 14,
        ),
      ),
      bodyTextLargeBold: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 18 / 16,
        ),
      ),
      bodyTextBaseSemibold: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 16 / 14,
        ),
      ),
      bodyTextSmallBold: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          height: 18 / 12,
        ),
      ),
      bodyTextSmallSemibold: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          height: 18 / 12,
        ),
      ),
      bodyTextHelper: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          height: 18 / 12,
        ),
      ),
      bodyTextCaption: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 10,
          height: 12 / 10,
        ),
      ),
      buttonBase: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 18 / 16,
        ),
      ),
      buttonSmall: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          height: 18 / 12,
        ),
      ),
      inputBase: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 18 / 16,
        ),
      ),
      navigationBarBase: AppThemeTextStyle(colorScheme).merge(
        const TextStyle(
          fontFamily: 'Averta',
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 16 / 14,
        ),
      ),
    );
  }
  @override
  AppThemeTextStyle get bodyText1 => bodyTextLargeBold;
  @override
  AppThemeTextStyle get bodyText2 => bodyTextLargeBold;
  @override
  AppThemeTextStyle get headline1 => _headline1;
  @override
  AppThemeTextStyle get headline2 => _headline2;
  @override
  AppThemeTextStyle get headline3 => _headline3;
  @override
  AppThemeTextStyle get headline4 => _headline4;
  @override
  AppThemeTextStyle get headline5 => headline4;
  @override
  AppThemeTextStyle get headline6 => headline4;
  @override
  AppThemeTextStyle get overline => bodyTextHelper;
}

class AppThemeTextStyle extends TextStyle {
  final AppThemeColorScheme colorScheme;

  const AppThemeTextStyle(
    this.colorScheme, {
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextOverflow? overflow,
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
          overflow: overflow,
        );

  @override
  AppThemeTextStyle copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    TextOverflow? overflow,
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
      overflow: overflow,
      debugLabel: debugLabel,
    );
  }

  @override
  AppThemeTextStyle merge(TextStyle? other) {
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
