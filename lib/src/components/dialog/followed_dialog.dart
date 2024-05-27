import 'package:endgame/src/components/followed_team_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class FollowedTeamsDialog extends StatelessWidget {
  const FollowedTeamsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FollowedTeamDialogTitle(),
          Column(
            children: [
              FollowedTeamCard(
                teamName: "Stealth Robotics",
                teamNumber: "4089",
              ),
              FollowedTeamCard(
                teamName: "Citrus Circuits",
                teamNumber: "1678",
              ),
              FollowedTeamCard(
                teamName: "Valor",
                teamNumber: "6800",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FollowedTeamDialogTitle extends StatefulWidget {
  const FollowedTeamDialogTitle({
    super.key,
  });

  @override
  State<FollowedTeamDialogTitle> createState() =>
      _FollowedTeamDialogTitleState();
}

class _FollowedTeamDialogTitleState extends State<FollowedTeamDialogTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Followed Team",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 17,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
