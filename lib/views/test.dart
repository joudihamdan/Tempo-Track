import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherView extends StatefulWidget {
  final String cityName;

  const WeatherView({super.key, required this.cityName});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  late String condition;
  late String conditionText;
  late double temperature;
  late double wind;
  late int humidity;
  late double avgTemperature;
  List<WeatherHour> hourlyWeather = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData(widget.cityName);
  }

  void setActiveHour() {
    final now = DateTime.now();
    final currentHour = '${now.hour.toString().padLeft(2, '0')}:00';

    setState(() {
      for (var hour in hourlyWeather) {
        hour.isActiveHour = hour.hour == currentHour;
      }
    });
  }

  Future<void> fetchWeatherData(String cityName) async {
    const apiKey = '52b3bf5c5f5546f8b68215916242203';
    final apiUrl =
        'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$cityName&days=1';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final currentWeather = data['current'];
      final forecastWeather = data['forecast']['forecastday'][0]['hour'];

      setState(() {
        condition = currentWeather['condition']['icon'];
        conditionText = currentWeather['condition']['text'];
        temperature = currentWeather['temp_c'];
        wind = currentWeather['wind_kph'];
        humidity = currentWeather['humidity'];
        avgTemperature = currentWeather['feelslike_c'];

        hourlyWeather =
            List<WeatherHour>.generate(forecastWeather.length, (index) {
          final hourData = forecastWeather[index];
          final hour = hourData['time'].toString().substring(11, 16);
          final temperature = hourData['temp_c'];
          final isActiveHour = hour ==
              DateTime.now(); // Check if the hour matches the current hour

          return WeatherHour(
            hour: hour,
            temperature: temperature,
            isActiveHour: isActiveHour,
          );
        });
      });
    } else {
      print('Error: ${response.statusCode}');
    }
    setActiveHour();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (condition == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cityName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Image.network(
                    'https:$condition',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    conditionText,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Wind: ${wind.toStringAsFixed(1)} km/h',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Humidity: $humidity%',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Average: ${avgTemperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyWeather.length,
                  itemBuilder: (context, index) {
                    final weatherHour = hourlyWeather[index];
                    final hour = weatherHour.hour;
                    final temperature = weatherHour.temperature;
                    final isActiveHour = weatherHour.isActiveHour;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color:
                              isActiveHour ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                hour,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isActiveHour
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('${temperature.toStringAsFixed(1)}°C',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    );
                  }),
            ),
          ]),
        ));
  }
}

class WeatherHour {
  final String hour;
  final double temperature;
  bool isActiveHour;

  WeatherHour({
    required this.hour,
    required this.temperature,
    required this.isActiveHour,
  });
}
