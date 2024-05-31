import 'package:endgame/src/components/cards/event_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';

class EventRegionHeaderCard extends StatefulWidget {
  const EventRegionHeaderCard({
    super.key,
    this.region,
    required this.eventsInRegion,
  });

  final String? region;
  final List<TBAEvent> eventsInRegion;

  @override
  State<EventRegionHeaderCard> createState() => _EventRegionHeaderCardState();
}

class _EventRegionHeaderCardState extends State<EventRegionHeaderCard> {
  bool collapsed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.region ?? "Regional Events",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      collapsed = !collapsed;
                    });
                  },
                  icon: Icon(
                    collapsed
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: ColorConstants.dialogTextColor,
                  ),
                ),
              ],
            ),
          ),
          if (!collapsed)
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.eventsInRegion.length,
              itemBuilder: (context, index) {
                return EventCard(
                  event: widget.eventsInRegion[index],
                );
              },
            ),
        ],
      ),
    );
  }
}
