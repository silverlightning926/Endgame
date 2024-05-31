import 'package:endgame/src/components/cards/live_event_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveEventDialog extends StatefulWidget {
  const LiveEventDialog({
    super.key,
    required this.liveEvents,
  });

  final List<TBAEvent> liveEvents;

  @override
  State<LiveEventDialog> createState() => _LiveEventDialogState();
}

class _LiveEventDialogState extends State<LiveEventDialog> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LiveEventDialogTitle(
            collapsed: collapsed,
            onCollapsePressed: () {
              setState(() {
                collapsed = !collapsed;
              });
            },
          ),
          collapsed
              ? const SizedBox()
              : widget.liveEvents.isEmpty
                  ? const NoLiveEventsDialog()
                  : StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: widget.liveEvents
                          .map((e) => LiveEventCard(
                                event: e,
                              ))
                          .toList(),
                    ),
        ],
      ),
    );
  }
}

class NoLiveEventsDialog extends StatelessWidget {
  const NoLiveEventsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: const Center(
        child: Text(
          "No live events",
          style: TextStyle(
            color: ColorConstants.dialogTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LiveEventDialogTitle extends StatelessWidget {
  const LiveEventDialogTitle({
    super.key,
    required this.onCollapsePressed,
    required this.collapsed,
  });

  final bool collapsed;
  final Function() onCollapsePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Live Events",
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorConstants.dialogTextColor,
          ),
        ),
        IconButton(
          onPressed: onCollapsePressed,
          icon: Icon(
            collapsed ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
          ),
          color: ColorConstants.dialogButtonColor,
          iconSize: 17,
        ),
      ],
    );
  }
}
