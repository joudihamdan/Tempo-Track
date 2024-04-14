import 'package:weather_app/models/weather_hour.dart';

class WeatherModel {
  String cityName;
  String image;
  DateTime date;
  DateTime time;
  String condition;
  double temp;
  double wind;
  double avg;
  double humidity;
  List<WeatherHourModel> hourlist;

  WeatherModel(
      {required this.cityName,
      required this.image,
      required this.date,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.time,
      required this.avg,
      required this.humidity,
      required this.hourlist});

  factory WeatherModel.fromjson(json, all) {
    final forecastWeather = json['hour'];
    return WeatherModel(
      cityName: all['location']['name'],
      time: DateTime.parse(all['current']['last_updated']),
      image: json['day']['condition']['icon'],
      date: DateTime.parse(json['date']),
      condition: json['day']['condition']['text'],
      temp: json['day']['maxtemp_c'].toDouble(),
      wind: json['day']['maxwind_kph'].toDouble(),
      avg: json['day']['avgtemp_c'].toDouble(),
      humidity: json['day']['avghumidity'].toDouble(),
      hourlist: List<WeatherHourModel>.from(
        forecastWeather.map(
          (hour) => WeatherHourModel(
            hour: hour['time'].toString().substring(11, 16),
            condition:  hour['condition']["text"],
            temp: hour['temp_c'].toDouble(),
            image: hour['condition']["icon"],
          ),
        ),
      ),
    );
  }
}




