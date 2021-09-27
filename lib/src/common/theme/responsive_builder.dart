import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Size designSize;

  const ResponsiveLayoutBuilder({
    required this.builder,
    this.designSize = ResponsiveLayoutHelper.defaultSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      return OrientationBuilder(
        builder: (_, Orientation orientation) {
          if (constraints.maxWidth != 0) {
            ResponsiveLayoutHelper.init(
              constraints,
              orientation: orientation,
              designSize: designSize,
            );
            return builder();
          }
          return Container();
        },
      );
    });
  }
}

class ResponsiveLayoutHelper {
  static const Size defaultSize = Size(375, 812);

  static late ResponsiveLayoutHelper _instance;

  static late double _scaleHeight;
  static late double _scaleWidth;
  static late double _scaleFactor;

  /// Size of the phone in UI Design , dp
  late Size designSize;

  late Orientation _orientation;
  late double _pixelRatio;
  late double _textScaleFactor;
  late double _screenWidth;
  late double _screenHeight;

  factory ResponsiveLayoutHelper() => _instance;

  ResponsiveLayoutHelper._();

  ///Get screen orientation
  Orientation get orientation => _orientation;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  double get pixelRatio => _pixelRatio;
  double get scaleFactor => _scaleFactor;

  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight;

  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth;

  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => _textScaleFactor;

  double scale(num size) => size * scaleFactor;

  static void init(
    BoxConstraints constraints, {
    Orientation orientation = Orientation.portrait,
    Size designSize = defaultSize,
  }) {
    _instance = ResponsiveLayoutHelper._()
      ..designSize = designSize
      .._orientation = orientation
      .._screenWidth = constraints.maxWidth
      .._screenHeight = constraints.maxHeight;

    _scaleHeight = _instance.screenHeight / designSize.height;
    _scaleWidth = _instance.screenWidth / designSize.width;
    _scaleFactor = min(_scaleWidth, _scaleHeight);

    var window = WidgetsBinding.instance?.window ?? ui.window;
    _instance._pixelRatio = window.devicePixelRatio;
    _instance._textScaleFactor = window.textScaleFactor;
  }
}

extension SizeExtension on num {
  double get scale => ResponsiveLayoutHelper().scale(this);
}
