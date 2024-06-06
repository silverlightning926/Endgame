import 'package:endgame/src/components/dialog/all_teams_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:flutter/material.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({super.key});

  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        const FollowedTeamsDialog(),
        AllTeamDialog(
          scrollController: _scrollController,
        ),
      ],
    );
  }
}
