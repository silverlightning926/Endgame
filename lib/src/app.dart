import 'package:endgame/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Endgame extends StatelessWidget {
  const Endgame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.purple,
          elevation: 0,
          titleTextStyle: GoogleFonts.majorMonoDisplay(
              fontSize: 35,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.purple[200],
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
