import 'package:http/http.dart' as http;
import 'weather.dart';
import 'dart:convert';

class CityWeather {
  late Weather cityWeather;

  Future<Weather> fetchWeather(String cityName) async {
    const String appid = "d7309845fca6151d9a1353f7c30ae6e8";

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName,br&appid=$appid'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    cityWeather = Weather.fromJson(data['weather'][0]);

    return cityWeather;
  }
}
