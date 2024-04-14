import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgwts/custom_container.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CostumContainer(widget: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              SearchBar(
                onSubmitted: (value) => {
                  BlocProvider.of<GetWeatherCubit>(context)
                      .getWeatherCubit(value),
                  
                  Navigator.pop(context)
                },
                shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                trailing: const [
                  Icon(
                    Icons.search_outlined,
                    size: 30,
                  )
                ],
                hintText: "Enter City Name",
                hintStyle: const MaterialStatePropertyAll(
                    TextStyle(fontSize: 17, color: Colors.grey)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(
                      "assets/images/Search.json",
                      height: 300),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
