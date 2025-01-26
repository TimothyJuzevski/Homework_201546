import 'package:flutter/material.dart';

class AppSettings extends InheritedWidget {
  final bool isDarkMode;
  final bool isCelsius;
  final Function(bool) toggleDarkMode;
  final Function(bool) toggleTemperatureUnit;

  const AppSettings({
    Key? key,
    required this.isDarkMode,
    required this.isCelsius,
    required this.toggleDarkMode,
    required this.toggleTemperatureUnit,
    required Widget child,
  }) : super(key: key, child: child);

  static AppSettings of(BuildContext context) {
    final AppSettings? result =
    context.dependOnInheritedWidgetOfExactType<AppSettings>();
    assert(result != null, 'No AppSettings found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppSettings oldWidget) {
    return isDarkMode != oldWidget.isDarkMode ||
        isCelsius != oldWidget.isCelsius;
  }
}
