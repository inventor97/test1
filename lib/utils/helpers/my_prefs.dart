
import 'package:shared_preferences/shared_preferences.dart';

class MyPrefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static String? getRegion() {
    String? s = _instance.getString('region');
    return s;
  }

  static Future setRegion(String type) async {
    await _instance.setString('region', type);
  }


  static String? getDistrict() {
    String? s = _instance.getString('district');
    return s;
  }

  static Future setDistrict(String type) async {
    await _instance.setString('district', type);
  }


  static String? getOrg() {
    String? s = _instance.getString('org');
    return s;
  }

  static Future setOrg(String type) async {
    await _instance.setString('org', type);
  }


}
