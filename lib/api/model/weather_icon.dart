import 'package:test1/api/model/weather_model.dart';

class WeatherIcon {
  static String getWeatherIcon(WeatherCode code) {
    switch (code) {
      case WeatherCode.clear:
        return "assets/png/clear.png";
      case WeatherCode.fog:
        return "assets/png/fog.png";
      case WeatherCode.heavyRain:
        return "assets/png/heavy_rain.png";
      case WeatherCode.heavySleet:
        return "assets/png/heavy_sleet.png";
      case WeatherCode.heavySnow:
        return "assets/png/light_snow.png";
      case WeatherCode.lightRain:
        return "assets/png/light_rain.png";
      case WeatherCode.lightSleet:
        return "assets/png/light_sleet.png";
      case WeatherCode.lightSnow:
        return "assets/png/light_snow.png";
      case WeatherCode.mostlyClear:
        return "assets/png/mostly_clear.png";
      case WeatherCode.mostlyCloudy:
        return "assets/png/mostly_cloudy.png";
      case WeatherCode.overcast:
        return "assets/png/overcast.png";
      case WeatherCode.partlyCloudy:
        return "assets/png/partly_cloudy.png";
      case WeatherCode.sleet:
        return "assets/png/sleet.png";
      case WeatherCode.snow:
        return "assets/png/snow.png";
      case WeatherCode.thunderstorm:
        return "assets/png/thunderstorm.png";
    }
  }
}