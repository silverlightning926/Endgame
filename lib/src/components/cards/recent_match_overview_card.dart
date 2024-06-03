import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentMatchOverviewCard extends StatelessWidget {
  final String teamNumber;
  final String eventName;

  final String matchNumber;
  final String matchType;

  final DateTime matchDateTime;

  final String redTeam1;
  final String redTeam2;
  final String redTeam3;
  final String redTeamScore;
  final int? redTeamRP;

  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;
  final String blueTeamScore;
  final int? blueTeamRP;

  const RecentMatchOverviewCard({
    super.key,
    required this.teamNumber,
    required this.eventName,
    required this.matchNumber,
    required this.matchType,
    required this.redTeam1,
    required this.redTeam2,
    required this.redTeam3,
    required this.blueTeam1,
    required this.blueTeam2,
    required this.blueTeam3,
    required this.matchDateTime,
    required this.redTeamScore,
    required this.blueTeamScore,
    this.redTeamRP,
    this.blueTeamRP,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: InkWell(
            // TODO: Implement Match Page
            onTap: () {},
            child: Ink(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: ColorConstants.matchCardBackgroundColor,
              ),
              child: MatchTeamTable(
                teamNumber: teamNumber,
                eventName: eventName,
                matchDateTime: matchDateTime,
                matchNumber: matchNumber,
                matchType: matchType,
                redTeam1: redTeam1,
                redTeam2: redTeam2,
                redTeam3: redTeam3,
                blueTeam1: blueTeam1,
                blueTeam2: blueTeam2,
                blueTeam3: blueTeam3,
                redTeamAmountOfRP: redTeamRP,
                blueTeamAmountOfRP: blueTeamRP,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MatchTeamTable extends StatelessWidget {
  const MatchTeamTable({
    super.key,
    required this.teamNumber,
    required this.eventName,
    required this.matchDateTime,
    required this.matchNumber,
    required this.matchType,
    required this.redTeam1,
    required this.redTeam2,
    required this.redTeam3,
    required this.blueTeam1,
    required this.blueTeam2,
    required this.blueTeam3,
    this.redTeamAmountOfRP,
    this.blueTeamAmountOfRP,
  });

  final String teamNumber;
  final String eventName;
  final DateTime matchDateTime;
  final String matchNumber;
  final String matchType;
  final String redTeam1;
  final String redTeam2;
  final String redTeam3;
  final int? redTeamAmountOfRP;
  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;
  final int? blueTeamAmountOfRP;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Team $teamNumber",
              style: GoogleFonts.roboto(
                color: ColorConstants.dialogTextColor,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              "@ $eventName",
              style: GoogleFonts.roboto(
                color: ColorConstants.dialogTextColor,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(color: ColorConstants.dialogTextColor),
        const SizedBox(height: 5),
        Text(
          "Recent Match",
          style: GoogleFonts.roboto(
            color: ColorConstants.dialogTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "${matchDateTime.hour}:${matchDateTime.minute} ${matchDateTime.hour > 12 ? "PM" : "AM"} on ${matchDateTime.month}/${matchDateTime.day}",
          style: GoogleFonts.roboto(
            color: ColorConstants.dialogTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 5),
        const Divider(color: ColorConstants.dialogTextColor),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              "Match $matchNumber",
              style: GoogleFonts.roboto(
                color: ColorConstants.dialogTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              matchType,
              style: GoogleFonts.roboto(
                color: ColorConstants.dialogTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Column(
          children: [
            RedAllianceTable(
              redTeam1: redTeam1,
              redTeam2: redTeam2,
              redTeam3: redTeam3,
              amountOfRP: redTeamAmountOfRP,
            ),
            const SizedBox(height: 5),
            BlueAllianceTable(
              blueTeam1: blueTeam1,
              blueTeam2: blueTeam2,
              blueTeam3: blueTeam3,
              amountOfRP: blueTeamAmountOfRP,
            ),
          ],
        ),
      ],
    );
  }
}

class RedAllianceTable extends StatelessWidget {
  const RedAllianceTable({
    super.key,
    required this.redTeam1,
    required this.redTeam2,
    required this.redTeam3,
    this.amountOfRP,
  });

  final String redTeam1;
  final String redTeam2;
  final String redTeam3;
  final int? amountOfRP;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: ColorConstants.redMatchCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "Red",
            style: GoogleFonts.roboto(
              color: ColorConstants.dialogTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TeamButton(team: redTeam1),
                const SizedBox(width: 5),
                TeamButton(team: redTeam2),
                const SizedBox(width: 5),
                TeamButton(team: redTeam3),
                const SizedBox(width: 5),
                TeamScore(
                  score: "70",
                  amountOfRP: amountOfRP,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlueAllianceTable extends StatelessWidget {
  const BlueAllianceTable({
    super.key,
    required this.blueTeam1,
    required this.blueTeam2,
    required this.blueTeam3,
    this.amountOfRP,
  });

  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;

  final int? amountOfRP;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: ColorConstants.blueMatchCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "Blue",
            style: GoogleFonts.roboto(
              color: ColorConstants.dialogTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TeamButton(team: blueTeam1),
                const SizedBox(width: 5),
                TeamButton(team: blueTeam2),
                const SizedBox(width: 5),
                TeamButton(team: blueTeam3),
                const SizedBox(width: 5),
                TeamScore(
                  score: "70",
                  amountOfRP: amountOfRP,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamScore extends StatelessWidget {
  final String score;
  final int? amountOfRP;

  const TeamScore({
    super.key,
    required this.score,
    this.amountOfRP,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ColorConstants.matchCardColorTeamScoreBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          amountOfRP != null
              ? Text(
                  "•" * amountOfRP!,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox(),
          Text(
            score,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorConstants.dialogTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TeamButton extends StatelessWidget {
  const TeamButton({
    super.key,
    required this.team,
  });

  final String team;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        team,
        style: GoogleFonts.roboto(
          color: ColorConstants.dialogTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
