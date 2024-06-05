import 'package:endgame/src/components/dialog/all_event_dialog.dart';
import 'package:endgame/src/components/dialog/live_event_dialog.dart';
import 'package:flutter/material.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 135, left: 7, right: 7, bottom: 10),
      children: const [
        LiveEventsDialog(),
        AllEventsDialog(),
      ],
    );
  }
}
