import 'package:flutter/material.dart';

class ColorConstants {
  static const navigationGradient = LinearGradient(
    stops: [
      0.0,
      0.6,
      1.0,
    ],
    colors: [
      Color.fromARGB(255, 51, 35, 219),
      Color.fromARGB(255, 105, 93, 241),
      Color.fromARGB(255, 51, 35, 219),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color scaffoldBackgroundColor = Colors.black;
}
