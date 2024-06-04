import 'package:endgame/src/components/dialog/all_teams_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:flutter/material.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({
    super.key,
    required this.followedTeams,
    required this.allTeams,
  });

  final List<TBATeamSimple> followedTeams;
  final List<TBATeamSimple> allTeams;

  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        FollowedTeamsDialog(
          followedTeams: widget.followedTeams,
        ),
        AllTeamDialog(
          allTeams: widget.allTeams,
          scrollController: _scrollController,
        ),
      ],
    );
  }
}
