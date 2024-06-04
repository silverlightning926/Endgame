import 'package:endgame/src/components/dialog/team_info_dialog.dart';
import 'package:endgame/src/components/navigation_elements/custom_app_bar.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';

class TeamDataScreen extends StatelessWidget {
  const TeamDataScreen({
    super.key,
    required this.team,
  });

  final TBATeam team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TeamInfoDialog(
              team: team,
            ),
          ],
        ),
      ),
    );
  }
}
