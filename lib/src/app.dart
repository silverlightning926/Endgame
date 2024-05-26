import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Endgame extends StatelessWidget {
  const Endgame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: GoogleFonts.majorMonoDisplay(
            fontSize: 35,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0x99FFFFFF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}