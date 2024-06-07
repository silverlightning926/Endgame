import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/storage_providers.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

class TeamCard extends ConsumerStatefulWidget {
  const TeamCard({
    super.key,
    required this.team,
  });

  final TBATeamSimple team;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamCardState();
}

class _TeamCardState extends ConsumerState<TeamCard> {
  bool isLoading = false;

  void _showToast(bool following, bool success) {
    final message = following
        ? success
            ? "Unfollowed ${widget.team.nickname} - ${widget.team.teamNumber}"
            : "Failed to unfollow ${widget.team.nickname} - ${widget.team.teamNumber}"
        : success
            ? "Followed ${widget.team.nickname} - ${widget.team.teamNumber}"
            : "Failed to follow ${widget.team.nickname} - ${widget.team.teamNumber}";
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

  @override
  Widget build(BuildContext context) {
    final followedTeamsAsyncValue = ref.watch(getFollowedTeamKeysProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: ColorConstants.dialogColor,
          child: InkWell(
            // TODO: Implement Team Page
            onTap: () {},
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
                          widget.team.nickname ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        widget.team.teamNumber.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "${widget.team.city}, ${widget.team.stateProv}, ${widget.team.country}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  followedTeamsAsyncValue.when(
                    data: (followedTeams) {
                      final isFollowed =
                          followedTeams.contains(widget.team.key);
                      return IconButton(
                        icon: isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Icon(
                                isFollowed ? Icons.star : Icons.star_border,
                                color: isFollowed ? Colors.yellow : null,
                              ),
                        onPressed: () async {
                          if (widget.team.key != null && !isLoading) {
                            setState(() {
                              isLoading = true;
                            });
                            bool success;
                            if (isFollowed) {
                              success = await ref.read(
                                  removeFollowedTeamKeyProvider(
                                          widget.team.key!)
                                      .future);
                            } else {
                              success = await ref.read(
                                  addFollowedTeamKeyProvider(widget.team.key!)
                                      .future);
                            }
                            if (mounted) {
                              setState(() {
                                isLoading = false;
                              });
                              _showToast(isFollowed, success);
                            }
                          } else {
                            _showToast(isFollowed, false);
                          }
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) => const Icon(Icons.error),
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
