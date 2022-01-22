import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uasmobile/weather_model.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//appid = b24f187152d5cec97d6753cf00ee510d

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      final queryParameter = {
        'q': cityName,
        'appid': 'b24f187152d5cec97d6753cf00ee510d',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameter);
      final response = await http.get(uri);
      return Weather.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
