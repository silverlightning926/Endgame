import 'package:endgame/src/components/recent_match_overview_card.dart';
import 'package:endgame/src/components/upcoming_match_overview_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class FollowedActivityDialog extends StatelessWidget {
  const FollowedActivityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: ColorConstants.dialogColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Followed Activity',
                  style: TextStyle(
                    color: ColorConstants.dialogTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 17,
                  ),
                  color: ColorConstants.dialogButtonColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpcomingMatchOverviewCard(
                    teamNumber: '4089',
                    eventName: 'Sillicon Valley Regional',
                    matchNumber: '34',
                    matchType: 'Qualification',
                    redTeam1: '2910',
                    redTeam2: '1778',
                    redTeam3: '4089',
                    blueTeam1: '2046',
                    blueTeam2: '2976',
                    blueTeam3: '1690',
                    matchDateTime: DateTime.now().add(
                      const Duration(days: 1),
                    ),
                  ),
                  RecentMatchOverviewCard(
                    teamNumber: '2910',
                    eventName: 'Glacier Peak District Event',
                    matchNumber: '34',
                    matchType: 'Qualification',
                    redTeam1: '2910',
                    redTeam2: '1778',
                    redTeam3: '4089',
                    blueTeam1: '2046',
                    blueTeam2: '2976',
                    blueTeam3: '1690',
                    matchDateTime: DateTime.now().subtract(
                      const Duration(days: 1),
                    ),
                    redTeamScore: "100",
                    blueTeamScore: "200",
                    redTeamRP: 2,
                    blueTeamRP: 3,
                  ),
                  UpcomingMatchOverviewCard(
                    teamNumber: '1678',
                    eventName: 'Huneme Port Regional',
                    matchNumber: '34',
                    matchType: 'Qualification',
                    redTeam1: '1678',
                    redTeam2: '4414',
                    redTeam3: '4481',
                    blueTeam1: '254',
                    blueTeam2: '5940',
                    blueTeam3: '1323',
                    matchDateTime: DateTime.now().add(
                      const Duration(days: 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
