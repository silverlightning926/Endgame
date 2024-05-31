import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';

class HomeScreenData {
  final Map<TBATeam, List<TBAMatch>> followedTeamMatches;

  HomeScreenData({required this.followedTeamMatches});
}
