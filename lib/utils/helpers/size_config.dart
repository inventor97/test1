
import 'dart:math' show pow, sqrt;
import 'package:flutter/widgets.dart'
    show BuildContext, MediaQuery, MediaQueryData;


class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockHorizontal;
  static late double blockVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double h;
  static late double v;
  static late double sp;

  static void initWidthAndHeight(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHeight / 100;

    sp = sqrt((pow(screenWidth, 2) + pow(screenHeight, 2))) / 350;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    h = (screenWidth - _safeAreaHorizontal) / 100;
    v = (screenHeight - _safeAreaVertical) / 100;
  }
}
extension SizeConfigExtension on num {
  double get sp => this * 2.3;
}

