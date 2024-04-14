import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_hour.dart';
import 'package:weather_app/widgwts/help.dart';

class WeatherHourWidget extends StatelessWidget {
  final WeatherHourModel weatherHour;
  const WeatherHourWidget({super.key, required this.weatherHour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(children: [
        Text(
          "${weatherHour.hour}",
          style: const TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset(
            getImageCondition(weatherHour.condition),
            height: 50,
            width: 50,
          ),
        ),
        Text(
          "${weatherHour.temp.ceil().toString()}˚",
          style: const TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
