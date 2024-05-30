import 'package:endgame/src/components/cards/event_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class EventRegionHeaderCard extends StatelessWidget {
  const EventRegionHeaderCard({
    super.key,
    this.region,
  });

  final String? region;

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
                  region ?? "Regional Events",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
          ),
          const EventCard(),
          const EventCard(),
        ],
      ),
    );
  }
}
