import 'package:endgame/src/components/dialog/all_event_dialog.dart';
import 'package:endgame/src/components/dialog/live_event_dialog.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';

class EventsTab extends StatelessWidget {
  final int currentYear;
  final List<District> districts;
  final List<TBAEvent> events;

  const EventsTab({
    super.key,
    required this.currentYear,
    required this.districts,
    required this.events,
  });

  List<TBAEvent> get liveEvents => events.where((e) {
        final now = DateTime.now();
        return e.startDate!.isBefore(now) && e.endDate!.isAfter(now);
      }).toList()
        ..sort((a, b) => a.startDate!.compareTo(b.startDate!));

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 135, left: 7, right: 7, bottom: 10),
      children: [
        LiveEventDialog(
          liveEvents: liveEvents,
        ),
        AllEventsDialog(
          currentYear: currentYear,
          districts: districts,
          events: events,
        ),
      ],
    );
  }
}
