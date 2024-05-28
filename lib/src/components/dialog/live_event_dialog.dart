import 'package:endgame/src/components/live_event_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveEventDialog extends StatelessWidget {
  const LiveEventDialog({
    super.key,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down),
                color: ColorConstants.dialogButtonColor,
                iconSize: 17,
              ),
            ],
          ),
          GridView(
            padding: const EdgeInsets.only(top: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              LiveEventCard(
                eventName: "Silicon Valley",
                eventDistrict: "Regional Event",
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 2)),
                eventLocation: "San Jose, CA",
                matchType: "Qual",
                matchNumber: "34",
                matchStreamUrl:
                    Uri.parse("https://www.twitch.tv/firstinspires"),
              ),
              LiveEventCard(
                eventName: "Glacier Peak",
                eventDistrict: "PNW District Event",
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 2)),
                eventLocation: "Snohomish, WA",
                matchType: "Qual",
                matchNumber: "34",
                matchStreamUrl:
                    Uri.parse("https://www.twitch.tv/firstinspires"),
              ),
              LiveEventCard(
                eventName: "Einstein",
                eventDistrict: "Championship Event",
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 2)),
                eventLocation: "Houston, TX",
                matchType: "Qual",
                matchNumber: "34",
                matchStreamUrl:
                    Uri.parse("https://www.twitch.tv/firstinspires"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
