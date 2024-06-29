import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  Future<void> _saveToHistory(String city) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('history') ?? [];
    if (!history.contains(city)) {
      history.add(city);
      await prefs.setStringList('history', history);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: () {
                final city = _cityController.text;
                _saveToHistory(city);
                Navigator.pushNamed(
                  context,
                  '/weatherDetail',
                  arguments: city,
                );
              },
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}