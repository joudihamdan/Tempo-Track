import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/widgwts/Seven_days_widget.dart';
import 'package:weather_app/widgwts/tomorrow_widget.dart';

class FullReport extends StatelessWidget {
  const FullReport({super.key});

  @override
  Widget build(BuildContext context) {
     final List<WeatherModel> weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: CustomScrollView(
              slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TomrrowWidget(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "In 7 Days",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverList(
        
              delegate:
                  SliverChildBuilderDelegate((context, index) => SevenDaysWidget(
                        i: index,
                      ),
                      childCount:weatherModel.length -1,
        
                      ),
        
                      ),
              ],
            ),
        ));
  }
}
