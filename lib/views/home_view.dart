import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgwts/no_weather.dart';
import 'package:weather_app/widgwts/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          leading: IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              size: 35,
            ),
            onPressed: () {},
          ),
          elevation: 0,
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView()));
                  },
                )),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is WeatherLoadedState) {
            return WeatherInfo();
          } else if (state is InitialState) {
            return const NoWeather();
          } else if (state is NotConnectedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Lottie.asset(
                    "assets/images/no internet.json",
                    width: 400,
                    height: 400,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Lottie.asset(
                    "assets/images/No_data.json",
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            );
          }
        }));
  }
}
