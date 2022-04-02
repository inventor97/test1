import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ntp/ntp.dart';
import 'package:screen/screen.dart';
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
  DateTime dateLocal = DateTime.now();
  
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
    getTime();
    Screen.keepOn(true);
    Timer.periodic(const Duration(seconds: 1), (Timer t)=> _setTime());
    Timer.periodic(const Duration(seconds: 60), (Timer t) => getWeatherCast());
    weatherData = await WeatherApi.getDetail(city);
    update();
  }

  void getTime() async {
    final internet = await InternetConnectionChecker().hasConnection;
    if(internet) {
      dateLocal = await NTP.now();
    }
    else {
      dateLocal = DateTime.now();
    }
    dateLocal = dateLocal.add(const Duration(seconds: 1));
    update();
  }

  void _setTime() async {
    dateLocal = dateLocal.add(const Duration(seconds: 1));
    timeString = DateFormat('HH : mm').format(dateLocal);
    update();
    date = dateLocal.day.toString();
    update();
    day = DayUtils().getDay(dateLocal.weekday);
    update();
    month = DayUtils().getMonth(dateLocal.month);
    update();
  }
}
