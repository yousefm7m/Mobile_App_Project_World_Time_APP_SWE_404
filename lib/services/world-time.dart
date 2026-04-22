import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = 'loading';
  String flag;
  String url;
  bool isDaytime = false;
  String date = '';
  String dayOfWeek = '';

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response res = await http.get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(res.body);
      String datetime = data['dateTime'];
      dayOfWeek = data['dayOfWeek'] ?? '';

      DateTime now = DateTime.parse(datetime);

      isDaytime = now.hour >= 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
      date = DateFormat.yMMMMd().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
      date = 'N/A';
      dayOfWeek = '';
    }
  }
}
