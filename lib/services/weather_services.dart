import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/wearther_model.dart';

class WeatherServices {
  Dio dio;
  String doamain = "https://api.weatherapi.com/v1";
  String apikey = "52b3bf5c5f5546f8b68215916242203";
  WeatherServices({required this.dio});

  Future<List<WeatherModel>> getWeatherNews(
      String location) async {
    try {
      Response response = await dio
          .get("$doamain/forecast.json?key=$apikey&q=$location&days=7");
      List<WeatherModel> weatherList = [];
      List<dynamic> forecastDays = response.data['forecast']['forecastday'];
      for (int i = 0; i < forecastDays.length; i++) {
        log(i.toString());
        final forecastData = forecastDays[i];
        WeatherModel weatherModel =
            WeatherModel.fromjson(forecastData, response.data);

        weatherList.add(weatherModel);
      }
      return weatherList;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops there is an dio error please try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there is an error please try later");
    }
  }
}
