import 'package:endgame/src/components/cards/live_event_card.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/home_screen_data_providers.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveEventsDialog extends ConsumerStatefulWidget {
  const LiveEventsDialog({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LiveEventsDialogState();
}

class _LiveEventsDialogState extends ConsumerState<LiveEventsDialog> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    final asyncEvents = ref.watch(getLiveEventsProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LiveEventDialogTitle(
            collapsed: collapsed,
            onCollapsePressed: () {
              setState(() {
                collapsed = !collapsed;
              });
            },
          ),
          if (!collapsed)
            asyncEvents.when(
              data: (List<TBAEvent> events) {
                if (events.isEmpty) {
                  return const LiveEventPrintDialog(
                    message: "No Live Events",
                  );
                }
                return StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: events
                      .map((TBAEvent event) => LiveEventCard(event: event))
                      .toList(),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorConstants.dialogTextColor,
                  ),
                ),
              ),
              error: (Object error, StackTrace stackTrace) {
                return const LiveEventPrintDialog(
                  message: "Unable To Load Live Events",
                );
              },
            ),
        ],
      ),
    );
  }
}

class LiveEventPrintDialog extends StatelessWidget {
  const LiveEventPrintDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: ColorConstants.dialogTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LiveEventDialogTitle extends StatelessWidget {
  const LiveEventDialogTitle({
    super.key,
    required this.onCollapsePressed,
    required this.collapsed,
  });

  final bool collapsed;
  final Function() onCollapsePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: onCollapsePressed,
          icon: Icon(
            collapsed ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
          ),
          color: ColorConstants.dialogButtonColor,
          iconSize: 17,
        ),
      ],
    );
  }
}
