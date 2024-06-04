import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: ColorConstants.navigationGradient,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          tooltip: "Search",
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const Text(
            "ENDGAME",
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              top: 7.0,
            ),
            child: Text(
              "Powered by The Blue Alliance & Statbotics",
              style: GoogleFonts.robotoCondensed(
                fontSize: 11.0,
                fontWeight: FontWeight.w300,
                color: ColorConstants.secondaryNavigationColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
