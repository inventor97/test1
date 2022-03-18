import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test1/api/model/region_model.dart';
import 'package:test1/api/services/region_api.dart';


class InitHive {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RegionModelAdapter());
    await Hive.openBox("regions");
    await Hive.openBox("districts");
    await Hive.openBox("organizations");
    saveRegions();
  }

  static void saveRegions() async {
    final Box countryBox = Hive.box("regions");
    if(countryBox.isEmpty) {
      countryBox.clear();
      countryBox.putAll(await RegionData.getRegions());
    }
  }

  static void addDistricts(int id) async{
    final Box districts = Hive.box("districts");
    districts.putAll(await RegionData.getDistricts(id));
  }

  static void addOrganizations(int id) async {
    final Box org = Hive.box("organizations");
    org.putAll(await RegionData.getOrganizations(id));
  }

  static List<String> getDistricts(int id) {
    final Box box = Hive.box("districts");
    List<String> districts = [];
    for (var key in box.keys) {
      double k = key/1000;
      if(k.toInt() == id) {
        districts.add(box.toMap()[key]);
      }
    }
    return districts;
  }

  static int getRegionId(String value) {
    final Box box = Hive.box("regions");
    for(int key in box.keys) {
      if(box.toMap()[key] == value) {
        return key;
      }
    }
    return -1;
  }

  static int getDistrictId(String value) {
    final Box box = Hive.box("districts");
    for(int key in box.keys) {
      if(box.toMap()[key] == value) {
        return key;
      }
    }
    return -1;
  }

  static int getOrganizationsId(String value) {
    final Box box = Hive.box("organizations");
    for(int key in box.keys) {
      if(box.toMap()[key] == value) {
        return key;
      }
    }
    return -1;
  }

  static List<String> getRegions()  {
    final Box box = Hive.box("regions");
    return List<String>.from(box.values);
  }

  static List<String> getOrganizations(int id) {
    final Box box = Hive.box("organizations");
    List<String> org = [];
    for (var key in box.keys) {
      RegionModel obj = box.toMap()[key];
      if(obj.id == id) {
        org.add(obj.title);
      }
    }
    return org;
  }
}