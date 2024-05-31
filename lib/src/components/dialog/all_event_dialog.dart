import 'package:endgame/src/components/cards/event_region_header_card.dart';
import 'package:endgame/src/components/season_picker.dart';
import 'package:endgame/src/season_division_picker.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';

class AllEventsDialog extends StatefulWidget {
  const AllEventsDialog({
    super.key,
    required this.currentYear,
    required this.districts,
    required this.events,
  });

  final int currentYear;
  final List<District> districts;
  final List<TBAEvent> events;

  @override
  State<AllEventsDialog> createState() => _AllEventsDialogState();
}

class _AllEventsDialogState extends State<AllEventsDialog> {
  int currentSeasonDivisionIndex = 0;
  late List<String> seasonDivision;

  void _onSeasonDivisionChanged(int index) {
    setState(() {
      currentSeasonDivisionIndex = index;
    });
  }

  @override
  void initState() {
    widget.districts.sort((a, b) => a.displayName!.compareTo(b.displayName!));

    seasonDivision = widget.events
        .where((e) => e.week != null)
        .map((e) => "Week ${e.week! + 1}")
        .toSet()
        .toList()
      ..sort();
    seasonDivision.insert(0, "All Weeks");
    seasonDivision.insert(1, "Pre-Season");
    seasonDivision.add("Championships");
    seasonDivision.add("Off-Season");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AllEventsDialogTitle(),
        SeasonPicker(
          currentYear: widget.currentYear,
        ),
        SeasonDivisionPicker(
          seasonDivision: seasonDivision,
          currentSeasonDivisionIndex: 0,
          onSeasonDivisionChanged: _onSeasonDivisionChanged,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.districts.length,
          itemBuilder: (context, index) {
            return EventRegionHeaderCard(
              region: widget.districts[index].displayName,
              eventsInRegion: widget.events
                  .where((e) =>
                      e.district != null &&
                      e.district!.key == widget.districts[index].key)
                  .toList()
                ..sort((a, b) => a.startDate!.compareTo(b.startDate!)),
            );
          },
        ),
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
