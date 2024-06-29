import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather_service.dart';

class WeatherDetailScreen extends StatefulWidget {
  @override
  _WeatherDetailScreenState createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  bool _isLoading = false;
  Map<String, dynamic>? _weatherData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final city = ModalRoute.of(context)!.settings.arguments as String;
    _fetchWeather(city);
  }

  void _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
    });

    final WeatherService weatherService = WeatherService();
    try {
      final data = await weatherService.fetchWeather(city);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print('Error fetching weather $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Detail Screen'),
      ),
      body: Center(
        child: _isLoading
            ? SpinKitFadingCircle(
          color: Colors.blue,
          size: 50.0,
        )
            : _weatherData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_weatherData!['name']}',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              '${_weatherData!['main']['temp']}°C',
              style: TextStyle(fontSize: 48),
            ),
            Text(
              '${_weatherData!['weather'][0]['description']}',
              style: TextStyle(fontSize: 24),
            ),
            Image.network(
              'http://openweathermap.org/img/w/${_weatherData!['weather'][0]['icon']}.png',
              scale: 0.5,
            ),
          ],
        )
            : Text('No weather data'),
      ),
    );
  }
}