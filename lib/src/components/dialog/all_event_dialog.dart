import 'package:endgame/src/components/season_picker.dart';
import 'package:endgame/src/season_division_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllEventsDialog extends ConsumerStatefulWidget {
  const AllEventsDialog({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllEventDialogState();
}

class _AllEventDialogState extends ConsumerState<AllEventsDialog> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AllEventsDialogTitle(),
        // TODO: Implement SeasonPicker
        SeasonPicker(),
        // TODO: Implement SeasonDivisionPicker Filtering
        SeasonDivisionPicker(),
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
