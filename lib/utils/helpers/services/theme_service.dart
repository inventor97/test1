import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";

  ThemeMode getThemeMode() {
    return isSavedDarkMode()?ThemeMode.dark:ThemeMode.light;
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