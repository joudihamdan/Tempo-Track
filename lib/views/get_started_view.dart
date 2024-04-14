import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgwts/bottom.dart';
import 'package:weather_app/widgwts/custom_container.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CostumContainer(
        widget: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Image.asset("assets/images/images-removebg-preview.png",
                  width: 200, height: 200, fit: BoxFit.fill),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weather \nForecast App",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 20, 44, 71)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "you can see the weather of the day and for 7 next days",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              customBottom(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomeView();
                    }),
                    (route) => false,
                  );
                },
                text: 'Get Started',
              )
            ],
          ),
        ),
      ),
    );
  }
}
