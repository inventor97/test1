import 'package:get/get.dart';

class DayUtils {
  String getDay(int d) {
    switch(d) {
      case 1: return "monday".tr;
      case 2: return "tuesday".tr;
      case 3: return "wednesday".tr;
      case 4: return "thursday".tr;
      case 5: return "friday".tr;
      case 6: return "saturday".tr;
      case 7: return "sunday".tr;
    }
    return "";
  }

  String getMonth(int month) {
    switch (month) {
      case 1: return "january".tr;
      case 2: return "february".tr;
      case 3: return "march".tr;
      case 4: return "april".tr;
      case 5: return "may".tr;
      case 6: return "june".tr;
      case 7: return "july".tr;
      case 8: return "august".tr;
      case 9: return "september".tr;
      case 10: return "october".tr;
      case 11: return "november".tr;
      case 12: return "december".tr;
    }
    return "";
  }
}