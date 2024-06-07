import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/storage_providers.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class FollowedTeamCard extends ConsumerStatefulWidget {
  final TBATeamSimple team;

  const FollowedTeamCard({
    super.key,
    required this.team,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FollowedTeamCardState();
}

class _FollowedTeamCardState extends ConsumerState<FollowedTeamCard> {
  bool isLoading = false;

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
                TeamImageReplacement(teamNumber: "${widget.team.teamNumber}"),
                const Gap(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.team.nickname ?? "",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.dialogTextColor,
                      ),
                    ),
                    Text(
                      "${widget.team.teamNumber}",
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
              onPressed: _removeTeam,
              icon: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.star),
              color: ColorConstants.followedTeamCardFollowButtomColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _removeTeam() async {
    if (widget.team.key != null && !isLoading) {
      setState(() {
        isLoading = true;
      });

      bool success = await ref
          .read(removeFollowedTeamKeyProvider(widget.team.key!).future);

      if (mounted) {
        setState(() {
          isLoading = false;
        });
        _showToast(success);
      }
    } else {
      _showToast(false);
    }
  }

  void _showToast(bool success) {
    final message = success
        ? "Unfollowed ${widget.team.nickname} - ${widget.team.teamNumber}"
        : "Failed to unfollow ${widget.team.nickname} - ${widget.team.teamNumber}";
    toastification.show(
      title: Text(message),
      context: context,
      style: ToastificationStyle.fillColored,
      dragToClose: true,
      closeOnClick: true,
      applyBlurEffect: true,
      autoCloseDuration: const Duration(seconds: 3),
      type: success ? ToastificationType.success : ToastificationType.error,
      icon: success ? const Icon(Icons.check) : const Icon(Icons.error),
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
