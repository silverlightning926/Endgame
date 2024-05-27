import 'package:flutter/material.dart';

class ColorConstants {
  static const Color scaffoldBackgroundColor = Colors.black;

  static const Color dialogColor = Color.fromARGB(255, 47, 44, 84);
  static const Color dialogTextColor = Colors.white;
  static const Color dialogButtonColor = Colors.white;

  static const Color followedTeamCardFollowButtomColor = Colors.yellow;
  static const Color followedTeamCardTeamImageReplacementBackgroundColor =
      Colors.white;
  static const Color followedTeamCardTeamImageReplacementTextColor =
      Color.fromARGB(255, 196, 194, 194);

  // Navigation Color Constants

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

  static const Color primaryNavigationColor = Colors.white;
  static const Color secondaryNavigationColor = Color(0x99FFFFFF);
}
