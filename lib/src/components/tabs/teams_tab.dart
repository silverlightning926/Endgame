import 'package:endgame/src/components/dialog/all_teams_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:flutter/material.dart';

class TeamsTab extends StatelessWidget {
  const TeamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        FollowedTeamsDialog(),
        AllTeamDialog(),
      ],
    );
  }
}
