import 'dart:convert';

import 'package:test1/api/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static Future<WeatherModel> getDetail(String city) async {
    final uri = Uri.parse("http://my2.dev.gov.uz/azamat/ru/weather/get-details?region=$city");
    final response = await http.post(uri);
    final parsed = await jsonDecode(response.body);
    if(response.statusCode == 200) {
      return WeatherModel.fromJson(parsed);
    }
    return WeatherModel(
        id: "",
        cityId: "",
        datetime: DateTime.now(),
        cloudAmount: "",
        airT: 0.0,
        meteors: "",
        weatherCode: WeatherCode.overcast,
        weatherCodeImage: "assets/png/overcast.png", datetimeMs: DateTime.now(),
        city: City(id: "", regionId: "", name: "", isRegionalCenter: false, latitude: 0.0, longitude: 0, hasData: "0", hasClimaticData: "0", isVisible: "0", title: ""),
        timeOfDay: "");;
  }
}