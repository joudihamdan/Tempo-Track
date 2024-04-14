import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/widgwts/help.dart';

class SevenDaysWidget extends StatelessWidget {
  int i;
  SevenDaysWidget({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    final WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel[i+1];
    return  Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${weatherModel.date.day}",
            style: const TextStyle(fontSize: 20),
          ),
    
          Image.asset(
            getImageCondition(weatherModel.condition),
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 70,
            child: Text(
              weatherModel.condition,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Text(
            "${weatherModel.temp.ceil().toString()}˚",
            style: const TextStyle( fontSize: 20),
          ),
          Text(
            "${weatherModel.wind.ceil().toString()}km/h",
            textAlign: TextAlign.center,
            style: const TextStyle( fontSize: 20),
          ),
        ],
      ),
    );
  }
}
