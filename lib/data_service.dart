
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherflutter/weather_model.dart';


class DataService {
  Future<WeatherModel> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '09c36f3b979b1751c473eb020965b2b2',
      'units': 'metric',
      'lang' : 'ru'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherModel.fromJSON(json);
  }
}