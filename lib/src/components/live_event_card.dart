import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    super.key,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.eventLocation,
    required this.matchNumber,
    required this.matchType,
    this.matchStreamUrl,
    required this.eventDistrict,
  });

  final String eventName;
  final String eventDistrict;
  final DateTime startDate;
  final DateTime endDate;
  final String eventLocation;
  final String matchNumber;
  final String matchType;
  final Uri? matchStreamUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: const BoxDecoration(
              color: ColorConstants.liveEventCardBackgroundColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: const TextStyle(
                    color: ColorConstants.dialogTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstants.dialogButtonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    eventDistrict,
                    style: const TextStyle(
                      color: ColorConstants.liveEventCardBackgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "${startDate.month}/${startDate.day} - ${endDate.month}/${endDate.day}, ${startDate.year}",
                  style: const TextStyle(
                    color: ColorConstants.dialogTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  eventLocation,
                  style: const TextStyle(
                    color: ColorConstants.dialogTextColor,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstants.dialogButtonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "$matchType $matchNumber",
                        style: const TextStyle(
                          color: ColorConstants.liveEventCardBackgroundColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    if (matchStreamUrl != null)
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_outlined),
                        color: ColorConstants.dialogButtonColor,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
