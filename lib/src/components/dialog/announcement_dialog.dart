import 'package:endgame/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementDialog extends StatefulWidget {
  final String announcementText;

  const AnnouncementDialog({
    super.key,
    required this.announcementText,
  });

  @override
  State<AnnouncementDialog> createState() => _AnnouncementDialogState();
}

class _AnnouncementDialogState extends State<AnnouncementDialog> {
  bool isAnnouncementVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAnnouncementVisible,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: ColorConstants.dialogColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnnouncmentDialogTitle(
              onPressed: () {
                setState(() {
                  isAnnouncementVisible = false;
                });
              },
            ),
            Text(
              widget.announcementText,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: ColorConstants.dialogTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncmentDialogTitle extends StatefulWidget {
  final Function() onPressed;

  const AnnouncmentDialogTitle({super.key, required this.onPressed});

  @override
  State<AnnouncmentDialogTitle> createState() => _AnnouncmentDialogTitleState();
}

class _AnnouncmentDialogTitleState extends State<AnnouncmentDialogTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Announcement",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConstants.dialogTextColor,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 17,
            ),
            color: ColorConstants.dialogButtonColor,
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
