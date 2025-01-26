import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/details_screen.dart';
import 'models/app_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  bool isCelsius = true;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  void toggleTemperatureUnit(bool value) {
    setState(() {
      isCelsius = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSettings(
      isDarkMode: isDarkMode,
      isCelsius: isCelsius,
      toggleDarkMode: toggleDarkMode,
      toggleTemperatureUnit: toggleTemperatureUnit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherSphere',
        theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/settings': (context) => SettingsScreen(),
          '/details': (context) => DetailsScreen(),
        },
      ),
    );
  }
}
