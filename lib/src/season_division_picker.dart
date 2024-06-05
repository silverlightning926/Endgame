import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/home_screen_data_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeasonDivisionPicker extends ConsumerWidget {
  const SeasonDivisionPicker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: link year to the year of the selected season
    final List<String> seasonDivision =
        ref.watch(getSeasonWeeksProvider(DateTime.now().year)).when(
              data: (List<String> seasonWeeks) {
                return seasonWeeks;
              },
              loading: () => const [],
              error: (error, stackTrace) => const [],
            );
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seasonDivision.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.dialogColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                seasonDivision[index],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
