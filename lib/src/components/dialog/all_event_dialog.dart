import 'package:endgame/src/components/cards/event_region_header_card.dart';
import 'package:endgame/src/components/season_picker.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/home_screen_data_providers.dart';
import 'package:endgame/src/providers/tba_api_providers.dart';
import 'package:endgame/src/season_division_picker.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AllEventsDialogTitle(),
        // TODO: Implement SeasonPicker
        SeasonPicker(),
        // TODO: Implement SeasonDivisionPicker Filtering
        SeasonDivisionPicker(),
        ref.watch(getStatusProvider).when(
              data: (TBAStatus status) {
                return ref
                    .watch(getEventsByDistrictForYearProvider(
                      status.currentSeason ?? DateTime.now().year,
                    ))
                    .when(
                      data: (Map<String, List<TBAEvent>> eventsByWeek) {
                        if (eventsByWeek.isEmpty) {
                          return const Text(
                            "No Events",
                            style: TextStyle(
                              color: ColorConstants.dialogTextColor,
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: eventsByWeek.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EventRegionHeaderCard(
                              eventsInRegion:
                                  eventsByWeek.values.elementAt(index),
                              region: eventsByWeek.keys.elementAt(index),
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            ColorConstants.dialogTextColor,
                          ),
                        ),
                      ),
                      error: (error, stackTrace) => const Center(
                        child: Text(
                          "Unable To Load Events",
                          style: TextStyle(
                            color: ColorConstants.dialogTextColor,
                          ),
                        ),
                      ),
                    );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ColorConstants.dialogTextColor,
                  ),
                ),
              ),
              error: (error, stackTrace) => const Center(
                child: Text(
                  "Unable To Load Events",
                  style: TextStyle(
                    color: ColorConstants.dialogTextColor,
                  ),
                ),
              ),
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
