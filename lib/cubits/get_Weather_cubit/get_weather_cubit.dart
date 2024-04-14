import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_Weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/wearther_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());

  StreamSubscription? streamSubscription;
  late List<WeatherModel> weatherModel;

  void getWeatherCubit(String cityName) async {
    try {
      weatherModel = await WeatherServices(dio: Dio()).getWeatherNews(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      log(e.toString());
      emit(FaliurState(erroeMessage: e.toString()));
    }
  }

  void checkConnection() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.wifi &&
          result != ConnectivityResult.mobile) {
        emit(NotConnectedState());
      } 
    });
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
