import 'package:endgame/src/components/navigation_elements/custom_app_bar.dart';
import 'package:endgame/src/components/navigation_elements/rounded_bottom_navigation_bar.dart';
import 'package:endgame/src/components/tabs/events_tab.dart';
import 'package:endgame/src/components/tabs/home_tab.dart';
import 'package:endgame/src/components/tabs/settings_tab.dart';
import 'package:endgame/src/components/tabs/teams_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    EventsTab(),
    TeamsTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const CustomAppBar(),
          bottomNavigationBar: RoundedBottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
            child: _tabs[_currentIndex],
          ),
        ),
      ),
    );
  }
}
