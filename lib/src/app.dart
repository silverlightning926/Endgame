import 'package:endgame/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Endgame extends StatelessWidget {
  const Endgame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
