import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgwts/bottom.dart';
import 'package:weather_app/widgwts/custom_container.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return CostumContainer(widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/sad cloud.png"),
          const Text(
            "There is no weather Yet \n Start search now",
            style: TextStyle(
                fontSize: 20,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          customBottom(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchView();
              }));
            }, text: "Enter your city name")
        ]),
    );
  }
}
