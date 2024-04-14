import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/views/full_report_view.dart';
import 'package:weather_app/widgwts/details.dart';
import 'package:weather_app/widgwts/help.dart';
import 'package:weather_app/widgwts/weather_hour_widget.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel[0];
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                // Text(
                //   "updated at ${weatherModel.time.hour}:${weatherModel.time.minute}",
                //   style: const TextStyle(fontSize: 15),
                // ),
                Image.asset(
                  getImageCondition(weatherModel.condition),
                  width: 210,
                  height: 210,
                  fit: BoxFit.cover,
                ),
                Text(
                  "${weatherModel.avg.ceil().toString()}˚",
                  style: const TextStyle(
                      fontSize: 80, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherModel.condition,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Details(
                            text: "Temp",
                            value: "${weatherModel.temp.ceil().toString()}˚"),
                        Details(
                            text: "Wind",
                            value: "${weatherModel.wind.toString()}km/h"),
                        Details(
                            text: "Humidty",
                            value:
                                "${weatherModel.humidity.ceil().toString()} %")
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<GetWeatherCubit>(context)
                              .getWeatherCubit(weatherModel.cityName,);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const FullReport();
                          }));
                        },
                        child: const Text(
                          "View full report",
                          style: TextStyle(
                              color: Color.fromARGB(255, 104, 35, 136),
                              fontSize: 15),
                        ))
                  ],
                ),
                SizedBox(
                  height: 135,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //shrinkWrap: true,
                    itemCount: weatherModel.hourlist.length,
                    itemBuilder: (contect, i) {
                      return WeatherHourWidget(
                          weatherHour: weatherModel.hourlist[i]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
