import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/weather_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/history_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/weather': (context) => WeatherScreen(),
    '/weatherDetail': (context) => WeatherDetailScreen(),
    '/settings': (context) => SettingsScreen(),
    '/history': (context) => HistoryScreen(),
  };
}