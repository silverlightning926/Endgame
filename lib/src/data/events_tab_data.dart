import 'package:endgame/src/serialized/tba/tba_event.dart';

class EventsTabData {
  final int currentYear;
  final List<District> districts;
  final List<TBAEvent> events;

  const EventsTabData({
    required this.currentYear,
    required this.districts,
    required this.events,
  });
}
