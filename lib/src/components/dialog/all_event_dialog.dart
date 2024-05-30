import 'package:endgame/src/components/cards/event_region_header_card.dart';
import 'package:endgame/src/components/season_picker.dart';
import 'package:endgame/src/season_division_picker.dart';
import 'package:flutter/material.dart';

class AllEventsDialog extends StatelessWidget {
  const AllEventsDialog({
    super.key,
    required this.seasons,
    required this.seasonDivision,
  });

  final List<String> seasons;
  final List<String> seasonDivision;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AllEventsDialogTitle(),
        SeasonPicker(seasons: seasons),
        SeasonDivisionPicker(seasonDivision: seasonDivision),
        const EventRegionHeaderCard(
          region: "PNW District",
        ),
        const EventRegionHeaderCard(),
      ],
    );
  }
}

class AllEventsDialogTitle extends StatelessWidget {
  const AllEventsDialogTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "All Events",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
