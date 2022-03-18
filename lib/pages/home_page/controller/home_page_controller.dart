import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:test1/api/model/weather_model.dart';
import 'package:test1/api/services/date_time_api.dart';
import 'package:test1/api/services/weather_api.dart';
import 'package:test1/pages/home_page/utils/day_utils.dart';
import 'package:intl/intl.dart';
import 'package:test1/pages/home_page/utils/region_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


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
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;
  
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
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
       _source = source;
       update();
    });

    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        timeString = DateFormat('hh : mm').format(DateTime.now());
        update();
        break;
      case ConnectivityResult.mobile:
        timeString = DateFormat('hh : mm').format(await DateTimeApi.getTime());
        update();
        break;
      case ConnectivityResult.wifi:
        timeString = DateFormat('hh : mm').format(await DateTimeApi.getTime());
        update();
        break;
    }
    DateTime time = await DateTimeApi.getTime();
    timeString = DateFormat('hh : mm').format(await DateTimeApi.getTime());
    date = time.day.toString();
    day = DayUtils().getDay(time.weekday);
    month = DayUtils().getMonth(time.month);
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _setTime());
    Timer.periodic(const Duration(seconds: 60), (Timer t) => getWeatherCast());
    weatherData = await WeatherApi.getDetail(city);
    update();
  }

  void _setTime() async {
    DateTime time = await DateTimeApi.getTime();
    timeString = DateFormat('hh : mm').format(await DateTimeApi.getTime());
    update();
    date = time.day.toString();
    update();
    day = DayUtils().getDay(time.weekday);
    update();
    month = DayUtils().getMonth(time.month);
    update();
  }
}

class MyConnectivity {
  MyConnectivity._internal();

  static final MyConnectivity _instance = MyConnectivity._internal();

  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}