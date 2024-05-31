import 'package:date_time_format/date_time_format.dart';
import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:flutter/material.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    super.key,
    required this.event,
  });

  final TBAEvent event;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Material(
        color: ColorConstants.dialogColor,
        child: InkWell(
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${event.city}, ${event.stateProv}, ${event.country}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorConstants.dialogTextColor,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: ColorConstants.dialogTextColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "${DateTimeFormat.format(
                      event.startDate!,
                      format: 'M j',
                    )} - ${DateTimeFormat.format(
                      event.endDate!,
                      format: 'M j',
                    )}, ${event.year}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColorConstants.dialogColor,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                if (event.webcasts.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              contentPadding: const EdgeInsets.all(10),
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Live Streams',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                for (final webcast in event.webcasts)
                                  ListTile(
                                    leading: const Icon(Icons.tv),
                                    title: Text(webcast.channel ?? ""),
                                    subtitle: Text(webcast.type ?? ""),
                                    onTap: () {},
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.play_arrow_outlined),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
