import 'package:endgame/src/components/cards/followed_team_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';

class FollowedTeamsDialog extends StatelessWidget {
  const FollowedTeamsDialog({
    super.key,
    required this.followedTeams,
  });

  final List<TBATeam> followedTeams;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FollowedTeamsDialogTitle(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: followedTeams.isEmpty
                ? [
                    const NoTeamsFollowedDialog(),
                  ]
                : followedTeams.map((team) {
                    return FollowedTeamCard(team: team);
                  }).toList(),
          )
        ],
      ),
    );
  }
}

class NoTeamsFollowedDialog extends StatelessWidget {
  const NoTeamsFollowedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: const Center(
        child: Text(
          "No Teams Followed",
          style: TextStyle(
            color: ColorConstants.dialogTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FollowedTeamsDialogTitle extends StatefulWidget {
  const FollowedTeamsDialogTitle({
    super.key,
  });

  @override
  State<FollowedTeamsDialogTitle> createState() =>
      _FollowedTeamsDialogTitleState();
}

class _FollowedTeamsDialogTitleState extends State<FollowedTeamsDialogTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Followed Teams",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConstants.dialogTextColor,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 17,
                ),
                color: ColorConstants.dialogButtonColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 17,
                ),
                color: ColorConstants.dialogButtonColor,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
