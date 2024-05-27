import 'package:endgame/src/components/upcoming_match_overview_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Followed Activity',
                style: TextStyle(
                  color: ColorConstants.dialogTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                    matchDateTime: DateTime.now().add(const Duration(days: 1)),
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
                    matchDateTime: DateTime.now().add(const Duration(days: 2)),
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
