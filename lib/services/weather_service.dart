import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}?q=$city&appid=${AppConstants.apiKey}&units=metric'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}