import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowedTeamCard extends StatelessWidget {
  final String teamName;
  final String teamNumber;
  final String? teamImage;

  const FollowedTeamCard({
    super.key,
    required this.teamName,
    required this.teamNumber,
    this.teamImage,
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
              children: [
                teamImage != null
                    ? Image.network(
                        teamImage!,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      )
                    : TeamImageReplacement(teamNumber: teamNumber),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.dialogTextColor,
                      ),
                    ),
                    Text(
                      teamNumber,
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
