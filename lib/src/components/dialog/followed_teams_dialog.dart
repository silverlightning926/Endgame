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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FollowedTeamsDialogTitle(),
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
      padding: const EdgeInsets.symmetric(vertical: 15),
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
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 17,
            ),
            color: ColorConstants.dialogButtonColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
