import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingMatchOverviewCard extends StatelessWidget {
  final String teamNumber;
  final String eventName;

  final String matchNumber;
  final String matchType;

  final DateTime matchDateTime;

  final String redTeam1;
  final String redTeam2;
  final String redTeam3;

  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;

  const UpcomingMatchOverviewCard({
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: //find a gradient that finds in with the theme but is not too distracting and does not blend with other ui elements\
            const LinearGradient(
          stops: [
            0.0,
            0.5,
            1.0,
          ],
          colors: [
            Color(0xFF7900a9),
            Color(0xFF9c00b4),
            Color(0xFF7900a9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
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
          blueTeam3: blueTeam3),
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
  });

  final String teamNumber;
  final String eventName;
  final DateTime matchDateTime;
  final String matchNumber;
  final String matchType;
  final String redTeam1;
  final String redTeam2;
  final String redTeam3;
  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;

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
        const Divider(color: Colors.white),
        const SizedBox(height: 5),
        Text(
          "Upcoming Match",
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
        const Divider(color: Colors.white),
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
            ),
            const SizedBox(height: 5),
            BlueAllianceTable(
              blueTeam1: blueTeam1,
              blueTeam2: blueTeam2,
              blueTeam3: blueTeam3,
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
  });

  final String redTeam1;
  final String redTeam2;
  final String redTeam3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          stops: [
            0.0,
            0.6,
            1.0,
          ],
          colors: [
            Color.fromARGB(255, 219, 35, 35),
            Color.fromARGB(255, 241, 93, 105),
            Color.fromARGB(255, 219, 35, 35),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
  });

  final String blueTeam1;
  final String blueTeam2;
  final String blueTeam3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          stops: [
            0.0,
            0.6,
            1.0,
          ],
          colors: [
            Color.fromARGB(255, 3, 179, 248),
            Color.fromARGB(255, 3, 191, 248),
            Color.fromARGB(255, 3, 179, 248),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
              ],
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
