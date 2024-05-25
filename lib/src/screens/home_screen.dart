import 'package:endgame/src/components/navigation_elements/rounded_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: const Text("ENDGAME"),
      ),
      bottomNavigationBar: const RoundedBottomNavigationBar(),
    );
  }
}
