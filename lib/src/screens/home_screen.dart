import 'package:endgame/src/components/navigation_elements/rounded_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Powered By\nThe Blue Alliance and Statbotics",
              textAlign: TextAlign.right,
              style: GoogleFonts.ptSansNarrow(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Colors.purple[100],
              ),
            ),
          ),
        ],
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
