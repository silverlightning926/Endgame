import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeasonDivisionPicker extends StatefulWidget {
  const SeasonDivisionPicker({
    super.key,
    required this.seasonDivision,
    required this.currentSeasonDivisionIndex,
    required this.onSeasonDivisionChanged,
  });

  final List<String> seasonDivision;
  final int currentSeasonDivisionIndex;
  final ValueChanged<int> onSeasonDivisionChanged;

  @override
  State<SeasonDivisionPicker> createState() => _SeasonDivisionPickerState();
}

class _SeasonDivisionPickerState extends State<SeasonDivisionPicker> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.currentSeasonDivisionIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.seasonDivision.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedIndex == index
                    ? ColorConstants.dialogColor
                    : const Color.fromARGB(50, 50, 35, 219),
                foregroundColor: selectedIndex == index
                    ? ColorConstants.dialogTextColor
                    : const Color.fromARGB(119, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onSeasonDivisionChanged(index);
              },
              child: Text(
                widget.seasonDivision[index],
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
