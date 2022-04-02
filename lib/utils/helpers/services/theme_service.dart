import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";
  final regionKey = "region";
  final districtKey = "district";
  final organizationKey = "organization";

  ThemeMode getThemeMode() {
    return isSavedDarkMode()?ThemeMode.dark:ThemeMode.light;
  }


  String? getRegion() {
    return _getStorage.read(regionKey);
  }

  void setRegion(String region) {
    _getStorage.write(regionKey, region);
  }

  String? getDistrict() {
    return _getStorage.read(districtKey);
  }

  void setDistrict(String? district) {
    _getStorage.write(districtKey, district);
  }

  String? getOrg() {
    return _getStorage.read(organizationKey);
  }

  void setOrg(String? org) {
    _getStorage.write(organizationKey, org);
  }


  bool isSavedDarkMode() {
    return _getStorage.read(storageKey)??false;
  }

  void saveMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode()?ThemeMode.light: ThemeMode.dark);
    saveMode(!isSavedDarkMode());
  }
}