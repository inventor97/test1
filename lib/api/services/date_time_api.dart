import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test1/api/model/date_time_model.dart';

class DateTimeApi {
  static Future<DateTime> getTime() async {
    final uri = Uri.parse("https://worldtimeapi.org/api/timezone/Asia/Tashkent");
    final response = await http.get(uri);
    final parsed = await jsonDecode(response.body);
    if(response.statusCode == 200) {
      DateTimeModel time = DateTimeModel.fromMap(parsed);
      return time.datetime.toLocal();
    }
    return DateTime.now();
  }
}