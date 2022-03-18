import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test1/api/model/region_model.dart';

class RegionData {
  static Future<Map<int , String>> getRegions() async {
    Map<int, String> map = {};
    final uri = Uri.parse("http://my2.dev.gov.uz/azamat/ru/weather/get-regions");
    final response = await http.get(uri);
    final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200) {
      for(var value in parsed) {
        map[value['id']] = value['title'];
      }
    }
    return map;
  }

  static Future<Map<int, String>> getDistricts(int id) async {
    Map<int, String> map = {};
    final uri = Uri.parse("http://my2.dev.gov.uz/azamat/ru/weather/get-districts?regionId=$id");
    final response = await http.get(uri);
    final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200) {
      for(var value in parsed) {
        map[value['id']] = value['title'];
      }
    }
    return map;
  }

  static Future<Map<int, RegionModel>> getOrganizations(int id) async {
    Map<int, RegionModel> map = {};
    final uri = Uri.parse("http://my2.dev.gov.uz/azamat/ru/weather/get-organizations?districtId=$id");
    final response = await http.get(uri);
    final parsed = await jsonDecode(utf8.decode(response.bodyBytes));
    if(response.statusCode == 200) {
      for(var value in parsed) {
        map[value['id']] = RegionModel(id: id, title: value['title']);
      }
    }
    return map;
  }

}