
import 'dart:math' show pow, sqrt;

class SizeConfig {
  static late double horizontal;
  static late double vertical;
  static late double sp;
  static late double diagonal;

  static void initWidthAndHeight(double width, double height) {
    horizontal = width / 100;
    vertical = height / 100;
    diagonal = sqrt((pow(width, 2) + pow(height, 2))) / 100;
    sp = sqrt((pow(width, 2) + pow(height, 2))) / 350;
  }
}

extension SizeConfigExtension on num {
  double get horizontal => this * SizeConfig.horizontal;

  double get vertical => this * SizeConfig.vertical;

  double get sp => this * 2.2;

  double get diagonal => this * SizeConfig.diagonal;
}
