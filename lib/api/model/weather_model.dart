
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:test1/api/model/weather_icon.dart';

enum WeatherCode{
  @JsonValue("clear")
  clear,

  @JsonValue("fog")
  fog,

  @JsonValue("heavy_rain")
  heavyRain,

  @JsonValue("heavy_sleet")
  heavySleet,

  @JsonValue("heavy_snow")
  heavySnow,

  @JsonValue("light_rain")
  lightRain,

  @JsonValue("light_sleet")
  lightSleet,

  @JsonValue("light_snow")
  lightSnow,

  @JsonValue("mostly_clear")
  mostlyClear,

  @JsonValue("mostly_cloud")
  mostlyCloudy,

  @JsonValue("overcast")
  overcast,

  @JsonValue("partly_cloudy")
  partlyCloudy,

  @JsonValue("sleet")
  sleet,

  @JsonValue("snow")
  snow,

  @JsonValue("thunderstorm")
  thunderstorm,

}

const weatherCodeEnumMap = <WeatherCode, dynamic> {
  WeatherCode.clear: 'clear',
  WeatherCode.fog: 'fog',
  WeatherCode.heavyRain: 'heavy_rain',
  WeatherCode.heavySleet: 'heavy_sleet',
  WeatherCode.heavySnow: 'heavy_snow',
  WeatherCode.lightRain: 'light_rain',
  WeatherCode.lightSleet: 'light_sleet',
  WeatherCode.lightSnow: 'light_snow',
  WeatherCode.mostlyClear: 'mostly_clear',
  WeatherCode.mostlyCloudy: 'mostly_cloud',
  WeatherCode.overcast: 'overcast',
  WeatherCode.partlyCloudy: 'partly_cloudy',
  WeatherCode.sleet: 'sleet',
  WeatherCode.snow: 'snow',
  WeatherCode.thunderstorm: 'thunderstorm',
};

class WeatherModel {
  WeatherModel({
    required this.id,
    required this.cityId,
    required this.datetime,
    required this.cloudAmount,
    required this.airT,
    required this.meteors,
    required this.weatherCode,
    required this.weatherCodeImage,
    required this.datetimeMs,
    required this.city,
    required this.timeOfDay,
  });

  String id;
  String cityId;
  DateTime datetime;
  String cloudAmount;
  double airT;
  dynamic meteors;
  WeatherCode weatherCode;
  String weatherCodeImage;
  DateTime datetimeMs;
  City city;
  String timeOfDay;


  factory WeatherModel.fromRawJson(String str) => WeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    id: json["id"],
    cityId: json["city_id"],
    datetime: DateTime.parse(json["datetime"]),
    cloudAmount: json["cloud_amount"],
    airT: json["air_t"].toDouble(),
    meteors: json["meteors"],
    weatherCode: $enumDecode(weatherCodeEnumMap, json["weather_code"]),
    weatherCodeImage: WeatherIcon.getWeatherIcon($enumDecode(weatherCodeEnumMap, json["weather_code"])),
    datetimeMs: DateTime.fromMillisecondsSinceEpoch(json["datetime_ms"] as int),
    city: City.fromJson(json["city"]),
    timeOfDay: json["time_of_day"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "datetime": datetime.toIso8601String(),
    "cloud_amount": cloudAmount,
    "air_t": airT,
    "meteors": meteors,
    "weather_code": weatherCodeEnumMap[weatherCode],
    "datetime_ms": datetimeMs.millisecondsSinceEpoch,
    "city": city.toJson(),
    "time_of_day": timeOfDay,
  };
}

class City {
  City({
    required this.id,
    required this.regionId,
    required this.name,
    required this.isRegionalCenter,
    required this.latitude,
    required this.longitude,
    required this.hasData,
    required this.hasClimaticData,
    required this.isVisible,
    required this.title,
  });

  String id;
  String regionId;
  String name;
  bool isRegionalCenter;
  double latitude;
  double longitude;
  String  hasData;
  String hasClimaticData;
  String isVisible;
  String title;

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    regionId: json["region_id"],
    name: json["name"],
    isRegionalCenter: json["is_regional_center"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    hasData: json["has_data"],
    hasClimaticData: json["has_climatic_data"],
    isVisible: json["is_visible"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "region_id": regionId,
    "name": name,
    "is_regional_center": isRegionalCenter,
    "latitude": latitude,
    "longitude": longitude,
    "has_data": hasData,
    "has_climatic_data": hasClimaticData,
    "is_visible": isVisible,
    "title": title,
  };
}
