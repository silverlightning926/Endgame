import 'package:endgame/src/components/cards/team_card.dart';
import 'package:flutter/material.dart';

class AllTeamDialog extends StatelessWidget {
  const AllTeamDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            "All Teams",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TeamCard(),
        TeamCard(),
        TeamCard(),
        TeamCard(),
        TeamCard(),
        TeamCard(),
        TeamCard(),
      ],
    );
  }
}
