import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:endgame/src/services/tba_api_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.team,
  });

  final TBATeamSimple team;

  Future<TBATeam> _fetchFullTeamData() async {
    return await TBAAPIService.getTeam(team.key ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: ColorConstants.dialogColor,
          child: InkWell(
            // TODO: Implement Team Page
            onTap: () async {
              TBATeam teamData = await _fetchFullTeamData();
              if (!context.mounted) return;
              GoRouter.of(context).push("/team", extra: teamData);
            },
            child: Ink(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          team.nickname ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        team.teamNumber.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "${team.city}, ${team.stateProv}, ${team.country}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // TODO: Implement Follow Button
                  IconButton(
                    icon: const Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
