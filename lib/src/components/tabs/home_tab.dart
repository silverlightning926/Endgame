import 'package:endgame/src/components/dialog/announcement_dialog.dart';
import 'package:endgame/src/components/dialog/followed_activity_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:endgame/src/components/dialog/live_event_dialog.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.followedTeamMatches,
    required this.liveEvents,
  });

  final Map<TBATeam, List<TBAMatch>> followedTeamMatches;
  final List<TBAEvent> liveEvents;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // TODO: Implement AnnouncementDialog
        const AnnouncementDialog(
          announcementText:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget nunc nec nunc ultricies ultricies.",
        ),
        // TODO: Implement FollowedActivityDialog
        const FollowedActivityDialog(),
        FollowedTeamsDialog(
          followedTeams: followedTeamMatches.keys.toList(),
        ),
        LiveEventDialog(
          liveEvents: liveEvents,
        ),
      ],
    );
  }
}
