import 'package:flutter/material.dart';
import 'package:gists_explorer/src/common/theme/app_theme.dart';
import 'package:gists_explorer/src/common/theme/responsive_builder.dart';
import 'package:gists_explorer/src/widgets/gist_list_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQueryData.fromWindow(
      WidgetsBinding.instance!.window,
    );
    const brightness = Brightness.dark; // ?? mediaQueryData.platformBrightness;

    AppTheme.configure(mediaQueryData: mediaQueryData);
    final initialTheme = brightness == Brightness.dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;

    return ResponsiveLayoutBuilder(
      designSize: AppTheme.defaultSize,
      builder: () => AppThemeProvider(
        initialTheme: initialTheme,
        child: Builder(
          builder: (context) => MaterialApp(
            title: 'Gists Explorer',
            initialRoute: '/',
            routes: {
              '/': (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Gist Explorer'),
                    ),
                    body: GistListView(),
                  ),
            },
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            theme: AppTheme.of(context).themeData,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
