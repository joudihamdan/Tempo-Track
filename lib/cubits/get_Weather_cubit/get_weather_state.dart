class WeatherState {}

class WeatherLoadedState extends WeatherState {}

class InitialState extends WeatherState {}

class FaliurState extends WeatherState {
  final String erroeMessage;

  FaliurState({required this.erroeMessage});
}

//class ConnectedState extends WeatherState {}

class NotConnectedState extends WeatherState {}
