import 'package:endgame/src/components/cards/followed_team_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';

class FollowedTeamsDialog extends StatefulWidget {
  const FollowedTeamsDialog({
    super.key,
    required this.followedTeams,
  });

  final List<TBATeam> followedTeams;

  @override
  State<FollowedTeamsDialog> createState() => _FollowedTeamsDialogState();
}

class _FollowedTeamsDialogState extends State<FollowedTeamsDialog> {
  bool collapsed = false;

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
          FollowedTeamsDialogTitle(
            collapsed: collapsed,
            onCollapsePressed: () {
              setState(() {
                collapsed = !collapsed;
              });
            },
          ),
          collapsed
              ? const SizedBox()
              : Column(
                  children: [
                    if (widget.followedTeams.isEmpty)
                      const NoTeamsFollowedDialog()
                    else
                      for (final team in widget.followedTeams)
                        FollowedTeamCard(
                          team: team,
                        ),
                  ],
                ),
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
      height: 100,
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

class FollowedTeamsDialogTitle extends StatelessWidget {
  const FollowedTeamsDialogTitle({
    super.key,
    required this.onCollapsePressed,
    required this.collapsed,
  });

  final Function() onCollapsePressed;
  final bool collapsed;

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
              // TODO: Implement Add Followed Team
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 17,
                ),
                color: ColorConstants.dialogButtonColor,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  collapsed
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 17,
                ),
                color: ColorConstants.dialogButtonColor,
                onPressed: onCollapsePressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
