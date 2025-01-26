import 'package:flutter/material.dart';
import '../models/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSettings = AppSettings.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appearance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text("Dark Mode"),
              value: appSettings.isDarkMode,
              onChanged: appSettings.toggleDarkMode,
            ),
            Divider(),
            Text(
              "Temperature Unit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text("Show in Celsius"),
              value: appSettings.isCelsius,
              onChanged: appSettings.toggleTemperatureUnit,
            ),
          ],
        ),
      ),
    );
  }
}
