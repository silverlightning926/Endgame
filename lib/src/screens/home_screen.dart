import 'package:endgame/src/components/navigation_elements/rounded_bottom_navigation_bar.dart';
import 'package:endgame/src/components/tabs/events_tab.dart';
import 'package:endgame/src/components/tabs/home_tab.dart';
import 'package:endgame/src/components/tabs/settings_tab.dart';
import 'package:endgame/src/components/tabs/teams_tab.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/data/home_screen_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.homeScreenData,
  });

  final HomeScreenData homeScreenData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navigationTabs = [
      HomeTab(
        followedTeamMatches: widget.homeScreenData.followedTeamMatches,
        liveEvents: widget.homeScreenData.events.where((e) {
          final now = DateTime.now();
          return e.startDate!.isBefore(now) && e.endDate!.isAfter(now);
        }).toList()
          ..sort((a, b) => a.startDate!.compareTo(b.startDate!)),
      ),
      EventsTab(
        currentYear:
            widget.homeScreenData.status.currentSeason ?? DateTime.now().year,
        districts: widget.homeScreenData.districts,
        events: widget.homeScreenData.events,
      ),
      TeamsTab(
        followedTeams: widget.homeScreenData.followedTeamMatches.keys.toList(),
        allTeams: widget.homeScreenData.teams,
      ),
      const SettingsTab(),
    ];

    return PopScope(
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              clipBehavior: Clip.none,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: ColorConstants.navigationGradient,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
            child: navigationTabs[_currentIndex],
          ),
        ),
      ),
    );
  }
}
