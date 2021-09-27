import 'package:flutter/material.dart';
import 'package:gists_explorer/src/common/theme/app_text_theme.dart';
import 'package:gists_explorer/src/common/theme/app_theme_color_scheme.dart';

class AppTheme {
  static Size _screenSize = Size.zero;

  static Iterable<AppTheme> themes = [
    lightTheme,
    darkTheme,
  ];

  static AppTheme darkTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.dark,
    baseThemeData: ThemeData.dark(),
  );

  static AppTheme lightTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  static const Size defaultSize = Size(375, 812);

  static late double _scaleWidth;
  static late double _scaleHeight;

  static double get scaleHeight => _scaleHeight;
  static double get scaleWidth => _scaleWidth;

  final ThemeData themeData;
  final AppTextTheme textTheme;
  final AppThemeColorScheme colors;

  AppTheme({
    required this.themeData,
    required this.textTheme,
    required this.colors,
  });

  @override
  int get hashCode => themeData.hashCode ^ textTheme.hashCode ^ colors.hashCode;

  bool get isDark => this == darkTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme &&
          runtimeType == other.runtimeType &&
          themeData == other.themeData &&
          textTheme == other.textTheme &&
          colors == other.colors;

  static void configure({required MediaQueryData mediaQueryData}) {
    _screenSize = mediaQueryData.size;
    _scaleHeight = _screenSize.height / defaultSize.height;
    _scaleWidth = _screenSize.width / defaultSize.width;
  }

  static AppTheme of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppThemeBindingScope>()!;
    return scope.applicationThemeProviderState.currentTheme;
  }

  static void toggleTheme(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppThemeBindingScope>()!;

    final currentTheme = scope.applicationThemeProviderState.currentTheme;

    scope.applicationThemeProviderState.updateTheme(
        currentTheme == AppTheme.darkTheme
            ? AppTheme.lightTheme
            : AppTheme.darkTheme);
  }

  static ThemeData _createBaseThemeData(
    AppThemeColorScheme colorScheme,
    AppTextTheme textTheme,
    ThemeData baseThemeData,
  ) =>
      baseThemeData.copyWith(
        primaryColor: colorScheme.backgroundScheme.primary,
        backgroundColor: colorScheme.backgroundScheme.primary,
        scaffoldBackgroundColor: colorScheme.backgroundScheme.primary,
        colorScheme: colorScheme,
        errorColor: colorScheme.colorFull.warning,
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        appBarTheme: baseThemeData.appBarTheme.copyWith(
          color: colorScheme.backgroundScheme.primary,
          centerTitle: false,
          toolbarTextStyle: textTheme.headline1.copyWith(
            color: colorScheme.grayScale.light,
          ),
          titleTextStyle: textTheme.headline1.copyWith(
            color: colorScheme.grayScale.light,
          ),
          iconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.grayScale.onDark,
          ),
          actionsIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.grayScale.onDark,
          ),
        ),
        buttonTheme: baseThemeData.buttonTheme.copyWith(
          minWidth: 0,
          padding: EdgeInsets.zero,
          buttonColor: colorScheme.grayScale.dark,
          colorScheme: baseThemeData.colorScheme.copyWith(
            secondary: colorScheme.grayScale.dark,
          ),
        ),
        primaryIconTheme: baseThemeData.iconTheme.copyWith(
          color: colorScheme.grayScale.onDark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: _scaleByHeight(12)),
          errorStyle: textTheme.bodyTextSmallSemibold.colorFullWarning(),
          labelStyle: textTheme.bodyTextSmallSemibold,
          hintStyle: textTheme.bodyTextLargeBold,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.grayScale.dark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.colorFull.primary.withOpacity(.8),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.colorFull.warning,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.colorFull.warning,
            ),
          ),
        ),
      );

  static AppTheme _initializeTheme({
    required AppThemeColorScheme colorScheme,
    required ThemeData baseThemeData,
  }) {
    final textTheme = AppTextTheme.byColorScheme(colorScheme);
    return AppTheme(
      colors: colorScheme,
      themeData: _createBaseThemeData(
        colorScheme,
        textTheme,
        baseThemeData,
      ),
      textTheme: textTheme,
    );
  }

  static double _scaleByHeight(double value) => value * _scaleHeight;
}

class AppThemeProvider extends StatefulWidget {
  final Widget child;
  final AppTheme initialTheme;

  const AppThemeProvider(
      {Key? key, required this.initialTheme, required this.child})
      : super(key: key);

  @override
  _AppThemeProviderState createState() => _AppThemeProviderState();
}

class _AppThemeBindingScope extends InheritedWidget {
  final _AppThemeProviderState applicationThemeProviderState;

  const _AppThemeBindingScope({
    Key? key,
    required this.applicationThemeProviderState,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppThemeBindingScope oldWidget) => true;
}

class _AppThemeProviderState extends State<AppThemeProvider> {
  late AppTheme currentTheme;

  @override
  Widget build(BuildContext context) {
    return _AppThemeBindingScope(
      applicationThemeProviderState: this,
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialTheme;
  }

  void updateTheme(AppTheme newTheme) {
    if (newTheme != currentTheme) {
      setState(() {
        currentTheme = newTheme;
      });
    }
  }
}

extension AppThemeTextStyleExtensions on AppThemeTextStyle {
  TextStyle backgroundPrimary() => copyWith(color: colorScheme.primary);

  TextStyle backgroundSecondary() => copyWith(color: colorScheme.secondary);

  TextStyle backgroundSecondaryVariant() =>
      copyWith(color: colorScheme.secondaryVariant);

  TextStyle colorFullWarning() =>
      copyWith(color: colorScheme.colorFull.warning);

  TextStyle colorFullSuccess() =>
      copyWith(color: colorScheme.colorFull.success);

  TextStyle colorFullPrimary() =>
      copyWith(color: colorScheme.colorFull.primary);

  TextStyle colorFullSecondary() =>
      copyWith(color: colorScheme.colorFull.secondary);

  TextStyle colorFullOnPrimary() => copyWith(color: colorScheme.onPrimary);

  TextStyle colorFullOnSecondary() => copyWith(color: colorScheme.onSecondary);

  TextStyle colorFullOnBackground() =>
      copyWith(color: colorScheme.onBackground);

  TextStyle colorFullOnError() => copyWith(color: colorScheme.onError);

  TextStyle grayScaleDark() => copyWith(color: colorScheme.grayScale.dark);

  TextStyle grayScaleMediumDark() =>
      copyWith(color: colorScheme.grayScale.mediumDark);

  TextStyle grayScaleMediumLight() =>
      copyWith(color: colorScheme.grayScale.mediumLight);

  TextStyle grayScaleLight() => copyWith(color: colorScheme.grayScale.light);

  TextStyle grayScaleTransparentLight() =>
      copyWith(color: colorScheme.grayScale.transparentLight);

  TextStyle grayScaleOnDark() => copyWith(color: colorScheme.grayScale.onDark);

  TextStyle grayScaleOnMediumDark() =>
      copyWith(color: colorScheme.grayScale.onMediumDark);
}
