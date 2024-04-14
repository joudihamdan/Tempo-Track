import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/widgwts/Seven_days_widget.dart';
import 'package:weather_app/widgwts/details.dart';
import 'package:weather_app/widgwts/help.dart';

class TomrrowWidget extends StatelessWidget {
  const TomrrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel[1];
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                getImageCondition(weatherModel.condition),
                width: 150,
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weatherModel.condition,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${weatherModel.avg.ceil().toString()}˚",
                    style: const TextStyle(
                        fontSize: 55, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Details(text: "Temp", value: "${weatherModel.temp.ceil().toString()}˚"),
              Details(
                  text: "Wind", value: "${weatherModel.wind.ceil().toString()}km/h"),
              Details(
                  text: "Humidty",
                  value: "${weatherModel.humidity.ceil().toString()} %")
            ],
          ),
        ],
      ),
    );
  }
}

class SevenDaysBuilder extends StatelessWidget {
  const SevenDaysBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            return  SevenDaysWidget(i:i);
          }),
    );
  }
}
