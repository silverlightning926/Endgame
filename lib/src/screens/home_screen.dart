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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              gradient: ColorConstants.navigationGradient,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              tooltip: "Search",
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text(
                "ENDGAME",
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                  top: 7.0,
                ),
                child: Text(
                  "Powered by The Blue Alliance & Statbotics",
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                    color: ColorConstants.secondaryNavigationColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RoundedBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
      body: navigationTabs[_currentIndex],
    );
  }
}
