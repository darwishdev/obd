import 'package:flutter/material.dart';

class AppTheme {
  static const mainGredient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color.fromARGB(255, 42, 101, 150),
      Color.fromARGB(255, 26, 63, 94),
    ],
  );
  static const mainBlue = Color.fromARGB(255, 26, 63, 94);
  static const redGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    colors: [
      Color.fromARGB(255, 173, 1, 1),
      Color.fromARGB(255, 95, 4, 4),
    ],
  );
  var yellowGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, .9, 1],
    colors: [
      Color.fromARGB(255, 47, 120, 131),
      Color.fromARGB(255, 40, 162, 178),
      Color.fromARGB(255, 65, 179, 196),
    ],
  );
  static const textColor = Color.fromARGB(255, 165, 164, 164);
  static final mainShadow = BoxShadow(
      color: const Color.fromARGB(255, 42, 101, 150).withAlpha(150),
      offset: const Offset(0, 4),
      blurRadius: 5.0);
}
