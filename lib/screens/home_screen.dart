import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  WeatherModel? _weatherData;
  bool _isLoading = false;
  bool _isDarkMode = false;
  bool _isCelsius = true;

  // Fetch weather details
  void fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await WeatherService().fetchWeather(city);
      setState(() {
        _weatherData = weather;
      });
    } catch (e) {
      _showErrorDialog();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Show error dialog
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("City name invalid, could not get weather details."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherSphere"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              final settings = await Navigator.pushNamed(context, '/settings');
              if (settings != null) {
                final settingsMap = settings as Map<String, dynamic>;
                setState(() {
                  _isDarkMode = settingsMap['isDarkMode'];
                  _isCelsius = settingsMap['isCelsius'];
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
              controller: _cityController,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 18, color: Colors.deepPurple),
                labelText: "Enter City",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                fetchWeather(_cityController.text);
              },
              child: Text("Get Weather", style: TextStyle(color: Colors.deepPurple),),
            ),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
            if (_weatherData != null)
              WeatherCard(
                weather: _weatherData!,
              ),
          ],
        ),
      ),
    );
  }
}
