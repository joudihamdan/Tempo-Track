import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 107, 75, 133);
  static const Color accentColor = Color.fromARGB(255, 236, 234, 78);
  static const Color lightTextColor = Colors.black;
  static const Color darkTextColor = Colors.white;
  static const Color appBarBackgroundLight = Colors.white;
  static const Color appBarBackgroundDark = Colors.grey;
  AppTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: lightTextColor,
        fontSize: 16,
      ),
      headline6: TextStyle(
        color: lightTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      
    ),
   
  );
    

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor:  Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
       shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18)))),

      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: darkTextColor,
        fontSize: 16,
      ),
      headline6: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
