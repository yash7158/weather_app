import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchWeatherForecast(String apiKey, String city) async {
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load weather forecast');
  }
}

Future fetchWeatherCurrent(String apiKey, String city) async {
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load weather forecast');
  }
}