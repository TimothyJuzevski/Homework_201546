import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:lottie/lottie.dart';
import '../models/app_settings.dart';

class DetailsScreen extends StatelessWidget {
  String getweatheranimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
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

  Text _buildRichText(String label, String value) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(fontSize: 18, color: Colors.deepPurple)
          ),
          TextSpan(
            text: value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = AppSettings.of(context);
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherModel;
    final temperature = appSettings.isCelsius
        ? weather.temperature.toInt()
        : ((weather.temperature * 9 / 5) + 32).toInt();

    return Scaffold(
      appBar: AppBar(title: Text("Weather Details")),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(weather.cityName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                SizedBox(height: 10),
                _buildRichText("Temperature: ", "$temperature°${appSettings.isCelsius ? 'C' : 'F'}"),
                _buildRichText("Feels Like: ", "${weather.feelsLike.toStringAsFixed(1)}°C"),
                _buildRichText("Humidity: ", "${weather.humidity}%"),
                _buildRichText("Pressure: ", "${weather.pressure} hPa"),
                _buildRichText("Sea level pressure: ", "${weather.sealevelpressure} hPa"),
                _buildRichText("Ground level pressure: ", "${weather.groundlevelpressure} hPa"),
                SizedBox(height: 10),
                _buildRichText("Wind Speed: ", "${weather.windSpeed} m/s"),
                _buildRichText("Wind Degree: ", "${weather.windDegree} °"),
                _buildRichText("Wind Gust: ", "${weather.windgust} m/s"),
                SizedBox(height: 10),
                _buildRichText("Cloudiness: ", "${weather.cloudiness} %"),
                _buildRichText("Rain Precipitation: ", "${weather.rainprecipitation} mm/h"),
                _buildRichText("Snow Precipitation: ", "${weather.snowprecipitation} mm/h"),
                SizedBox(height: 10),
                _buildRichText("Current Weather: ", weather.mainCondition),
                Lottie.asset(getweatheranimation(weather.mainCondition)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}