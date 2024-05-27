import 'package:endgame/src/components/dialog/announcement_dialog.dart';
import 'package:endgame/src/components/dialog/followed_activity_dialog.dart';
import 'package:endgame/src/components/dialog/followed_teams_dialog.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: 135,
        left: 7,
        right: 7,
      ),
      children: const [
        AnnouncementDialog(
          announcementText:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget nunc nec nunc ultricies ultricies.",
        ),
        FollowedActivityDialog(),
        FollowedTeamsDialog(),
      ],
    );
  }
}
