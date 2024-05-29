import 'package:flutter/material.dart';

class ColorConstants {
  // Dialog Color Constants

  static const Color dialogColor = Color.fromARGB(125, 50, 35, 219);
  static const Color dialogTextColor = Colors.white;
  static const Color dialogButtonColor = Colors.white;

  // Followed Team Card Color Constants

  static const Color followedTeamCardFollowButtomColor = Colors.yellow;
  static const Color followedTeamCardTeamImageReplacementBackgroundColor =
      Colors.white;
  static const Color followedTeamCardTeamImageReplacementTextColor =
      Color.fromARGB(255, 196, 194, 194);

  // Match Card Color Constants

  static const Color matchCardBackgroundColor =
      Color.fromARGB(175, 50, 35, 219);

  // Live Event Card Color Constants

  static const Color liveEventCardBackgroundColor =
      Color.fromARGB(175, 50, 35, 219);

  static const LinearGradient redMatchCardColor = LinearGradient(
    stops: [
      0.0,
      0.6,
      1.0,
    ],
    colors: [
      Color.fromARGB(255, 219, 35, 35),
      Color.fromARGB(255, 241, 93, 105),
      Color.fromARGB(255, 219, 35, 35),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueMatchCardColor = LinearGradient(
    stops: [
      0.0,
      0.6,
      1.0,
    ],
    colors: [
      Color.fromARGB(255, 3, 179, 248),
      Color.fromARGB(255, 3, 191, 248),
      Color.fromARGB(255, 3, 179, 248),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const matchCardColorTeamScoreBackground =
      Color.fromARGB(162, 97, 97, 97);

  // Navigation Color Constants

  static const Color scaffoldBackgroundColor = Colors.black;

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
