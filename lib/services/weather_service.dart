import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  final String apiKey = "01ed379689966de1cc6e5b03b34cd406";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel> fetchWeather(String city) async {
    final response = await http.get(Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
