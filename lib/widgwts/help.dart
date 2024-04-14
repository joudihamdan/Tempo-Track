import 'package:flutter/material.dart';

MaterialColor getWeatherCondition(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }

  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.orange;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.indigo;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.grey;
    case 'patchy sleet possible':
      return Colors.cyan;
    case 'patchy freezing drizzle possible':
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.blue;
    case 'blizzard':
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.blue;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
    case 'moderate rain at times':
      return Colors.indigo;
    case 'moderate rain':
    case 'heavy rain at times':
      return Colors.blue;
    case 'heavy rain':
      return Colors.indigo;
    default:
      return const MaterialColor(1, {
        50: Color(0xFFEDE7F6),
        100: Color(0xFFD1C4E9),
        200: Color(0xFFB39DDB),
        300: Color(0xFF9575CD),
      });
  }
}

String getImageCondition(String condition) {

  switch (condition.toLowerCase()) {
    case 'sunny':
      return "assets/images/sunny.png";
    case 'partly cloudy':
      return "assets/images/partly cloudy.png";
    case 'cloudy':
      return "assets/images/cloudy.webp";
    case 'overcast':
      return "assets/images/overcast.webp";
    case 'mist':
      return "assets/images/mist.png";
    case 'patchy rain possible':
      return "assets/images/patchy rain possible.png";
    case 'patchy snow possible':
      return "assets/images/patchy snow possible.png";
    // case 'patchy sleet possible':
    //   return Colors.cyan;
    // case 'patchy freezing drizzle possible':
    // case 'thundery outbreaks possible':
    //   return Colors.deepPurple;
    // case 'blowing snow':
    //   return Colors.blue;
    // case 'blizzard':
    // case 'fog':
    //   return Colors.grey;
    // case 'freezing fog':
    //   return Colors.blueGrey;
    // case 'patchy light drizzle':
    //   return Colors.lightBlue;
    // case 'light drizzle':
    // case 'freezing drizzle':
    // case 'heavy freezing drizzle':
    //   return Colors.blue;
    // case 'patchy light rain':
    //   return Colors.lightBlue;
    // case 'light rain':
    // case 'moderate rain at times':
    //   return Colors.indigo;
    // case 'moderate rain':
    // case 'heavy rain at times':
    //   return Colors.blue;
    // case 'heavy rain':
    //   return Colors.indigo;
    default:
      return 'assets/images/images-removebg-preview.png';
  }
}
