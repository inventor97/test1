import 'dart:async';

import 'package:get/get.dart';
import 'package:test1/api/model/weather_model.dart';
import 'package:test1/api/services/weather_api.dart';
import 'package:test1/pages/home_page/utils/day_utils.dart';
import 'package:intl/intl.dart';
import 'package:test1/pages/home_page/utils/region_utils.dart';


class HomePageController extends GetxController {

  WeatherModel weatherData = WeatherModel(
      id: "",
      cityId: "",
      datetime: DateTime.now(),
      cloudAmount: "",
      airT: 0.0,
      meteors: "",
      weatherCode: WeatherCode.overcast,
      weatherCodeImage: "assets/png/overcast.png", datetimeMs: DateTime.now(),
      city: City(id: "", regionId: "", name: "", isRegionalCenter: false, latitude: 0.0, longitude: 0, hasData: "0", hasClimaticData: "0", isVisible: "0", title: ""),
      timeOfDay: "");
  String image = "assets/png/background_light.png";
  String city = 'tashkent';
  String timeString = '';
  String date = '';
  String day = '';
  String month = '';
  
  void typeCity(String v) {
    city = v;
    update();
  }
  
  void getWeatherCast() async {
    weatherData = await WeatherApi.getDetail(RegionUtils().getRegion(city));
    update();
  }
  
  @override
  void onInit() async {
    super.onInit();
    timeString = DateFormat('hh : mm').format(DateTime.now());
    date = DateTime.now().day.toString();
    day = DayUtils().getDay(DateTime.now().weekday);
    month = DayUtils().getMonth(DateTime.now().month);
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setTime());
    Timer.periodic(const Duration(seconds: 60), (Timer t) => getWeatherCast());
    weatherData = await WeatherApi.getDetail(city);
    update();
  }

  void _setTime() {
    timeString = DateFormat('hh : mm').format(DateTime.now());
    update();
    date = DateTime.now().day.toString();
    update();
    day = DayUtils().getDay(DateTime.now().weekday);
    update();
    month = DayUtils().getMonth(DateTime.now().month);
    update();

  }
}