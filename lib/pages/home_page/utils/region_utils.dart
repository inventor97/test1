import 'package:get/get.dart';
import 'package:test1/utils/helpers/messages.dart';

class RegionUtils {
  String getRegion(String region) {
    String reg = "";
    Messages().en.forEach((key, value) { if(value == region) reg = key;});
    Messages().uz.forEach((key, value) { if(value == region) reg = key;});
    Messages().ru.forEach((key, value) { if(value == region) reg = key;});
    return reg;
  }

  List<String> regions = [
    "tashkent".tr,
    "andijan".tr,
    "bukhara".tr,
    "gulistan".tr,
    "jizzakh".tr,
    "qarshi".tr,
    "navoiy".tr,
    "namangan".tr,
    'nukus'.tr,
    'samarkand'.tr,
    'termez'.tr,
    'urgench'.tr,
    'fergana'.tr,
  ];
}