import 'package:endgame/src/constants/color_constants.dart';
import 'package:endgame/src/providers/home_screen_data_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeasonPicker extends ConsumerWidget {
  const SeasonPicker({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButton<Object?>(
        isExpanded: true,
        items: ref.watch(getSeasonsProvider).when(
              data: (List<String> seasons) {
                return seasons
                    .map(
                      (String season) => DropdownMenuItem(
                        value: season,
                        child: Text(
                          season,
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorConstants.dialogTextColor,
                          ),
                        ),
                      ),
                    )
                    .toList();
              },
              loading: () => [
                const DropdownMenuItem(
                  value: null,
                  child: Text(
                    "Loading Seasons",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstants.dialogTextColor,
                    ),
                  ),
                ),
              ],
              error: (error, stackTrace) => const [
                DropdownMenuItem(
                  value: null,
                  child: Text(
                    "Unable To Load Seasons",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstants.dialogTextColor,
                    ),
                  ),
                ),
              ],
            ),
        onChanged: (Object? value) {},
      ),
    );
  }
}
