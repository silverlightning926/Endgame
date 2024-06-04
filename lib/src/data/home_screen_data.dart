import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';

class HomeScreenData {
  final TBAStatus status;
  final Map<TBATeamSimple, List<TBAMatch>> followedTeamMatches;
  final List<TBAEvent> events;
  final List<District> districts;
  final List<TBATeamSimple> teams;

  HomeScreenData({
    required this.status,
    required this.followedTeamMatches,
    required this.events,
    required this.districts,
    required this.teams,
  });
}
