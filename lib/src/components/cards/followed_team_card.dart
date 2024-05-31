import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowedTeamCard extends StatelessWidget {
  final TBATeam team;

  const FollowedTeamCard({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorConstants.dialogColor,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamImageReplacement(teamNumber: "${team.teamNumber}"),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      team.name ?? "",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.dialogTextColor,
                      ),
                    ),
                    Text(
                      "${team.teamNumber}",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: ColorConstants.dialogTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star),
              color: ColorConstants.followedTeamCardFollowButtomColor,
            ),
          ],
        ),
      ),
    );
  }
}

class TeamImageReplacement extends StatelessWidget {
  const TeamImageReplacement({
    super.key,
    required this.teamNumber,
  });

  final String teamNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color:
            ColorConstants.followedTeamCardTeamImageReplacementBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          teamNumber,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorConstants.followedTeamCardTeamImageReplacementTextColor,
          ),
        ),
      ),
    );
  }
}
