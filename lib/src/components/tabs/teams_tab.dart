import 'package:endgame/src/components/dialog/all_teams_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';

class TeamsTab extends StatelessWidget {
  const TeamsTab({super.key, required this.followedTeams});

  final List<TBATeam> followedTeams;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FollowedTeamsDialog(
          followedTeams: followedTeams,
        ),
        const AllTeamDialog(),
      ],
    );
  }
}
