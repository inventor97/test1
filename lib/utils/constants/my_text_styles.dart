
import 'package:flutter/material.dart';
import 'package:test1/utils/utils.dart';

class MyTextStyles {
  static TextStyle montserrat400({
    double fontSize = 5,
    Color color = MyColors.black,
  }) =>
      TextStyle(
        fontFamily: "MontserratRegular",
        fontSize: fontSize.sp,
        color: color,
      );

  static TextStyle montserrat500({
    double fontSize = 5,
    Color color = MyColors.black,
  }) =>
      TextStyle(
        fontFamily: "MontserratMedium",
        fontSize: fontSize.sp,
        color: color,
      );

  static TextStyle montserrat700({
    double fontSize = 5,
    Color color = MyColors.black,
  }) =>
      TextStyle(
        fontFamily: "MontserratBold",
        fontSize: fontSize.sp,
        color: color,
      );
}
