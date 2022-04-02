
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/utils/constants/my_colors.dart';
import 'package:test1/utils/constants/my_text_styles.dart';

class MyTheme {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: MyColors.color900,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.color900,
    backgroundColor: MyColors.color900,
    textTheme: TextTheme(
      headline1: MyTextStyles.montserrat500(fontSize: 46.0, color: MyColors.white),
      headline2: MyTextStyles.montserrat500(fontSize: 15.0, color: MyColors.white),
      headline6: MyTextStyles.montserrat500(fontSize: 11.0, color: MyColors.white),
      headline3: MyTextStyles.montserrat500(fontSize: 18.0, color: MyColors.white),
      headline5: MyTextStyles.montserrat500(fontSize: 25.0, color: MyColors.white),
    ),
      primaryTextTheme: TextTheme(
        headline1: MyTextStyles.montserrat500(fontSize: 64.0, color: MyColors.white),
        headline2: MyTextStyles.montserrat500(fontSize: 20.0, color: MyColors.white),
        headline6: MyTextStyles.montserrat500(fontSize: 16.0, color: MyColors.white),
        headline3: MyTextStyles.montserrat500(fontSize: 23.0, color: MyColors.white),
        headline5: MyTextStyles.montserrat500(fontSize: 28.0, color: MyColors.white),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.color800,
      ),
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: MyColors.white,
    textTheme: TextTheme(
      headline1: MyTextStyles.montserrat500(fontSize: 46.0, color: MyColors.color800),
      headline2: MyTextStyles.montserrat500(fontSize: 15.0, color: MyColors.textColor),
      headline6: MyTextStyles.montserrat500(fontSize: 11.0, color: MyColors.textColor),
      headline3: MyTextStyles.montserrat500(fontSize: 18.0, color: MyColors.subTextColor),
      headline4: MyTextStyles.montserrat500(fontSize: 18.0),
      headline5: MyTextStyles.montserrat500(fontSize: 25.0),
    ),

      primaryTextTheme: TextTheme(
        headline1: MyTextStyles.montserrat500(fontSize: 64.0, color: MyColors.color800),
        headline2: MyTextStyles.montserrat500(fontSize: 20.0, color: MyColors.textColor),
        headline6: MyTextStyles.montserrat500(fontSize: 16.0, color: MyColors.subTextColor),
        headline3: MyTextStyles.montserrat500(fontSize: 23.0),
        headline5: MyTextStyles.montserrat500(fontSize: 28.0),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: MyColors.color800,
      )
  );
}