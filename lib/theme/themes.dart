import 'package:flutter/material.dart';

ThemeData getThemeData(BuildContext context) {
  // ThemeData
  return ThemeData(
    fontFamily: "Exo2",
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      background: const Color(0xFF000000),
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 161, 161, 161),
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.transparent),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return green, otherwise blue
          if (states.contains(MaterialState.pressed)) {
            return Colors.green;
          }
          return Colors.transparent;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return size 40, otherwise 20
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(fontSize: 40, color: Colors.white);
          }
          return TextStyle(fontSize: 20, color: Colors.white);
        }),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 40),
        ),
      ),
    ),
    primaryColor: Colors.black,
    dividerColor: Color.fromARGB(78, 255, 255, 255),

    /* dark theme settings */
  );
}
