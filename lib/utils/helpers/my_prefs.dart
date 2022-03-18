
import 'package:shared_preferences/shared_preferences.dart';

class MyPrefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void saveData(String key, dynamic value) async {
    if (value is int) {
      _instance.setInt(key, value);
    } else if (value is String) {
      _instance.setString(key, value);
    } else if (value is bool) {
      _instance.setBool(key, value);
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

}
