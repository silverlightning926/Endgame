import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/data/home_screen_data.dart';
import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:endgame/src/services/storage_service.dart';
import 'package:endgame/src/services/tba_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  _loadData() async {
    List followedTeamsRequestFuture = await Future.wait([
      TBAAPIService.getStatus(),
      StorageService.getFollowedTeams(),
    ]);

    TBAStatus status = followedTeamsRequestFuture[0];
    List<String> followedTeams = followedTeamsRequestFuture[1];

    Map<TBATeamSimple, List<TBAMatch>> followedTeamsMatches = {};

    for (String teamKey in followedTeams) {
      TBATeamSimple team = await TBAAPIService.getTeamSimple(teamKey);
      List<TBAMatch> matches = await TBAAPIService.getTeamMatchesForYear(
        teamKey,
        status.currentSeason ?? DateTime.now().year,
      );

      followedTeamsMatches[team] = matches;
    }

    List otherDataRequestFuture = await Future.wait({
      TBAAPIService.getEventsForYear(
        status.currentSeason ?? DateTime.now().year,
      ),
      TBAAPIService.getDistrictsForYear(
        status.currentSeason ?? DateTime.now().year,
      ),
      TBAAPIService.getTeamsSimple(0),
    });

    return HomeScreenData(
      status: status,
      followedTeamMatches: followedTeamsMatches,
      events: otherDataRequestFuture[0],
      districts: otherDataRequestFuture[1],
      teams: otherDataRequestFuture[2],
    );
  }

  @override
  void initState() {
    _loadData().then((data) {
      GoRouter.of(context).go('/', extra: data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: ColorConstants.navigationGradient,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ENDGAME",
            textAlign: TextAlign.center,
            style: GoogleFonts.majorMonoDisplay(
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          const SpinKitFadingCube(
            color: ColorConstants.primaryNavigationColor,
            size: 75,
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            "Loading...",
            textAlign: TextAlign.center,
            style: GoogleFonts.majorMonoDisplay(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
