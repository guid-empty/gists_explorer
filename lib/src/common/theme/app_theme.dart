import 'package:flutter/material.dart';
import 'package:gists_explorer/src/common/theme/app_text_theme.dart';
import 'package:gists_explorer/src/common/theme/app_theme_color_scheme.dart';

class AppTheme {
  static Size _screenSize = Size.zero;

  static Iterable<AppTheme> themes = [lightTheme, darkTheme];

  static AppTheme darkTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.dark,
    baseThemeData: ThemeData.dark(),
  );

  static AppTheme lightTheme = _initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  static const Size defaultSize = Size(360, 720);

  static double _scaleWidth;
  static double _scaleHeight;

  static double get scaleHeight => _scaleHeight;
  static double get scaleWidth => _scaleWidth;

  final ThemeData themeData;
  final AppTextTheme textTheme;
  final AppThemeColorScheme colors;

  AppTheme({
    @required this.themeData,
    @required this.textTheme,
    @required this.colors,
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

  static void configure({@required MediaQueryData mediaQueryData}) {
    _screenSize = mediaQueryData.size;
    _scaleHeight = _screenSize.height / defaultSize.height;
    _scaleWidth = _screenSize.width / defaultSize.width;
  }

  static AppTheme of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppThemeBindingScope>();
    return scope.applicationThemeProviderState.currentTheme;
  }

  static void toggleTheme(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppThemeBindingScope>();

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
        primaryColor: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.background,
        cardColor: colorScheme.background,
        accentColor: colorScheme.onPrimaryHighEmphasis,
        buttonColor: colorScheme.onPrimaryHighEmphasis,
        colorScheme: colorScheme,
        errorColor: colorScheme.error,
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        accentTextTheme: textTheme,
        appBarTheme: baseThemeData.appBarTheme.copyWith(
          elevation: 0,
          color: colorScheme.surface,
          centerTitle: false,
          textTheme: textTheme.copyWith(
            headline6: textTheme.headline6.copyWith(
              color: colorScheme.onSurfaceHighEmphasis,
            ),
          ),
          iconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.onSurfaceMediumEmphasis,
          ),
          actionsIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.onSurfaceMediumEmphasis,
          ),
        ),
        bottomNavigationBarTheme:
            baseThemeData.bottomNavigationBarTheme.copyWith(
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurfaceMediumEmphasis,
          elevation: 0,
          backgroundColor: colorScheme.surface,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: textTheme.caption1M.primary(),
          selectedIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.primary,
          ),
          unselectedLabelStyle: textTheme.caption1M.onSurfaceMediumEmphasis(),
          unselectedIconTheme: baseThemeData.iconTheme.copyWith(
            color: colorScheme.onSurfaceMediumEmphasis,
          ),
        ),
        buttonTheme: baseThemeData.buttonTheme.copyWith(
          minWidth: 0,
          padding: EdgeInsets.zero,
          buttonColor: colorScheme.onPrimaryHighEmphasis,
          colorScheme: baseThemeData.colorScheme.copyWith(
            secondary: colorScheme.secondary,
          ),
        ),
        primaryIconTheme: baseThemeData.iconTheme.copyWith(
          color: colorScheme.onPrimaryHighEmphasis,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.all(_scaleByHeight(16)),
          errorStyle: textTheme.caption1R.error(),
          labelStyle: textTheme.bodyText1,
          hintStyle: textTheme.caption1R,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.outline,
            ),
            borderRadius: BorderRadius.all(Radius.circular(_scaleByHeight(8))),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: colorScheme.primary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(_scaleByHeight(8))),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: colorScheme.error,
            ),
            borderRadius: BorderRadius.all(Radius.circular(_scaleByHeight(8))),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: colorScheme.error,
            ),
            borderRadius: BorderRadius.all(Radius.circular(_scaleByHeight(8))),
          ),
        ),
      );

  static AppTheme _initializeTheme({
    @required AppThemeColorScheme colorScheme,
    @required ThemeData baseThemeData,
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

  AppThemeProvider({Key key, @required this.initialTheme, @required this.child})
      : assert(initialTheme != null),
        super(key: key);

  @override
  _AppThemeProviderState createState() => _AppThemeProviderState();
}

class _AppThemeBindingScope extends InheritedWidget {
  final _AppThemeProviderState applicationThemeProviderState;

  _AppThemeBindingScope({
    Key key,
    @required this.applicationThemeProviderState,
    Widget child,
  })  : assert(applicationThemeProviderState != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppThemeBindingScope oldWidget) => true;
}

class _AppThemeProviderState extends State<AppThemeProvider> {
  AppTheme currentTheme;

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
  TextStyle onSurfaceHighEmphasis() =>
      copyWith(color: colorScheme.onSurfaceHighEmphasis);

  TextStyle onSurfaceMediumEmphasis() =>
      copyWith(color: colorScheme.onSurfaceMediumEmphasis);

  TextStyle onSurfaceDisabled() =>
      copyWith(color: colorScheme.onSurfaceDisabled);

  TextStyle onPrimaryHighEmphasis() =>
      copyWith(color: colorScheme.onPrimaryHighEmphasis);

  TextStyle onPrimaryMediumEmphasis() =>
      copyWith(color: colorScheme.onPrimaryMediumEmphasis);

  TextStyle onPrimaryDisabled() =>
      copyWith(color: colorScheme.onPrimaryDisabled);

  TextStyle primary() => copyWith(color: colorScheme.primary);

  TextStyle secondary() => copyWith(color: colorScheme.secondary);

  TextStyle error() => copyWith(color: colorScheme.error);

  TextStyle green() => copyWith(color: colorScheme.green);

  TextStyle onPrimary() => copyWith(color: colorScheme.onPrimary);

  TextStyle onSecondary() => copyWith(color: colorScheme.onSecondary);

  TextStyle onBackground() => copyWith(color: colorScheme.onBackground);

  TextStyle onError() => copyWith(color: colorScheme.onError);
}
