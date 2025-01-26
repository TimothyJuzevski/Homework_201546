import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../models/app_settings.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  WeatherCard({required this.weather});
  String getweatheranimation(String? mainCondition){
    if(mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()){
      case 'clouds':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'mist':
        return 'assets/mist.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }
  @override
  Widget build(BuildContext context) {
    final appSettings = AppSettings.of(context);
    final temperature = appSettings.isCelsius
        ? weather.temperature.toInt()
        : ((weather.temperature * 9 / 5) + 32).toInt();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weather.cityName, style: TextStyle(fontSize: 25, color: Colors.deepPurple)),
            Lottie.asset(getweatheranimation(weather.mainCondition)),
            Text(
              "Temperature: $temperature°${appSettings.isCelsius ? 'C' : 'F'}",
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
            Text(weather.mainCondition ?? "", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: weather,
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  ),
                ),
                child: Text("More Details", style: TextStyle(color: Colors.deepPurple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
