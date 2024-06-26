import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/screens/home_screen.dart';
import 'package:endgame/src/screens/loading_screen.dart';
import 'package:endgame/src/screens/team_data_screen.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class Endgame extends StatefulWidget {
  const Endgame({super.key});

  @override
  State<Endgame> createState() => _EndgameState();
}

class _EndgameState extends State<Endgame> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: const ToastificationConfig(
        alignment: Alignment.bottomCenter,
      ),
      child: MaterialApp.router(
        title: "Endgame",
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: '/loading',
          routes: [
            GoRoute(
              path: '/loading',
              builder: (context, state) => const LoadingScreen(),
            ),
            GoRoute(
              path: '/',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
            GoRoute(
              path: '/team',
              builder: (context, state) {
                final data = state.extra as TBATeam;
                return TeamDataScreen(
                  team: data,
                );
              },
            ),
          ],
        ),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            elevation: 0,
            titleTextStyle: GoogleFonts.majorMonoDisplay(
              fontSize: 40,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0,
            selectedItemColor: ColorConstants.primaryNavigationColor,
            unselectedItemColor: ColorConstants.secondaryNavigationColor,
          ),
        ),
      ),
    );
  }
}
