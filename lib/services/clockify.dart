import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:international_system_of_units/international_system_of_units.dart';
import 'dart:math';
import 'package:clocky/Api.dart';
import 'package:http/http.dart';

class Clockify {
  String location;
  String time;
  String flag;
  String url;
  bool isDay;
  bool isEvening;
  bool isNight;
  String temp;
  String weatherUrl;
  String desc;

  Clockify({this.location, this.flag, this.url, this.weatherUrl});

  Future<void> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"].toString().substring(0, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now
          .add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
      if (now.hour > 6 && now.hour <= 15) {
        isDay = true;
      } else if (now.hour > 15 && now.hour <= 19) {
        isEvening = true;
      } else
        isNight = true;

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Error Retriving Time";
    }
  }

  Future<void> getTemp() async {
    try {
      String key = API;
      Response response = await get(
          "http://api.openweathermap.org/data/2.5/weather?q=$weatherUrl&appid=$key");
      Map data = jsonDecode(response.body);
      print(data);
      String descr;
      descr = data["weather"].toString();
      var arr = descr.split(",");
      String descc = (arr[2]).toString().substring(14).toUpperCase();
      desc = descc;
      print(desc);

      String rawtemp = data["main"].toString().substring(7, 12);
      num kelvin = num.parse(rawtemp);
      num intTemp = (kelvin.toCelsius).round();
      temp = intTemp.toString();
    } catch (e) {
      temp = "Error Getting Weather!";
      desc = "Error getting data!";
    }
  }
}
