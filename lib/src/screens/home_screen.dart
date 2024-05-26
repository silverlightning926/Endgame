import 'package:endgame/src/components/navigation_elements/rounded_bottom_navigation_bar.dart';
import 'package:endgame/src/components/tabs/events_tab.dart';
import 'package:endgame/src/components/tabs/home_tab.dart';
import 'package:endgame/src/components/tabs/settings_tab.dart';
import 'package:endgame/src/components/tabs/teams_tab.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<Widget> navigationTabs = [
    HomeTab(),
    EventsTab(),
    TeamsTab(),
    SettingsTab(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
            gradient: ColorConstants.navigationGradient,
          ),
        ),
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
                color: const Color(0xCCFFFFFF),
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
      bottomNavigationBar: RoundedBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
      body: navigationTabs[_currentIndex],
    );
  }
}
