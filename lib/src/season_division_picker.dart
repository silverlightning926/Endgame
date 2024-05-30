import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SeasonDivisionPicker extends StatelessWidget {
  const SeasonDivisionPicker({
    super.key,
    required this.seasonDivision,
  });

  final List<String> seasonDivision;

  @override
  Widget build(BuildContext context) {
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
                foregroundColor: ColorConstants.dialogTextColor,
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
