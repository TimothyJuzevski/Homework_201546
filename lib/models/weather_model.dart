class WeatherModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final String mainCondition;
  final int sealevelpressure;
  final int groundlevelpressure;
  final int windDegree;
  final double windgust;
  final int cloudiness;
  final double rainprecipitation;
  final double snowprecipitation;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.mainCondition,
    required this.sealevelpressure,
    required this.groundlevelpressure,
    required this.windDegree,
    required this.windgust,
    required this.cloudiness,
    required this.rainprecipitation,
    required this.snowprecipitation,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
      mainCondition: json['weather'][0]['main'],
      sealevelpressure: json['main']['sea_level'] ?? 0,
      groundlevelpressure: json['main']['grnd_level'] ?? 0,
      windDegree: json['wind']['deg'] ?? 0,
      windgust: (json['wind']['gust'] ?? 0.0).toDouble(),
      cloudiness: json['clouds']['all'] ?? 0,
      rainprecipitation: (json['rain'] != null && json['rain']['1h'] != null) ? json['rain']['1h'].toDouble() : 0.0,
      snowprecipitation: (json['snow'] != null && json['snow']['1h'] != null) ? json['snow']['1h'].toDouble() : 0.0,
    );
  }
}