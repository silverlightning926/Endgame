import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SeasonPicker extends StatelessWidget {
  const SeasonPicker({
    super.key,
    required this.currentYear,
  });

  final int currentYear;

  @override
  Widget build(BuildContext context) {
    List<String> years = List.generate(
      currentYear - 1991,
      (index) => (currentYear - index).toString(),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorConstants.dialogColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButton(
        value: years[0],
        underline: const SizedBox(),
        isExpanded: true,
        items: years.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }
}
