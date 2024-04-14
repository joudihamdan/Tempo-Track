import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/theme.dart';
import 'package:weather_app/theme_manager.dart';
import 'package:weather_app/views/get_started_view.dart';


void main() async {
  print('hellooo');
  // List<WeatherModel> weatherList =
  //     await WeatherServices(dio: Dio()).getWeatherNews('cairo', 7);

  // print(weatherList.length);
  // for (WeatherModel weather in weatherList) {
  //   print("City: ${weather.cityName} + ${weather.time.hour.toString()}");
  // }

  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit()..checkConnection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //themeMode: ThemeMode.dark,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeManager.themeMode,

        //accentColor: AppTheme.accentColor,

        home:GetStartedView()
      ),
    );
  }
}
