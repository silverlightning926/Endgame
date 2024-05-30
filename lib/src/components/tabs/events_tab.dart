import 'package:endgame/src/components/dialog/all_event_dialog.dart';
import 'package:endgame/src/components/dialog/live_event_dialog.dart';
import 'package:flutter/material.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> seasons = [
      "1992",
      "1993",
      "1994",
      "1995",
      "1996",
      "1997",
      "1998",
      "1999",
      "2000",
      "2001",
      "2002",
      "2003",
      "2004",
      "2005",
      "2006",
      "2007",
      "2008",
      "2009",
      "2010",
      "2011",
      "2012",
      "2013",
      "2014",
      "2015",
      "2016",
      "2017",
      "2018",
      "2019",
      "2020",
      "2021",
      "2022",
      "2023",
      "2024",
      "2025",
    ];

    List<String> seasonDivision = [
      "Pre-Season",
      "Week 1",
      "Week 2",
      "Week 3",
      "Week 4",
      "Week 5",
      "Week 6",
      "Week 7",
      "Week 8",
      "Championship",
      "May Off-Season"
          "June Off-Season",
      "July Off-Season",
      "August Off-Season",
      "September Off-Season",
      "October Off-Season",
      "November Off-Season",
      "December Off-Season",
    ];

    return ListView(
      padding: const EdgeInsets.only(top: 135, left: 7, right: 7, bottom: 10),
      children: [
        const LiveEventDialog(),
        AllEventsDialog(seasons: seasons, seasonDivision: seasonDivision),
      ],
    );
  }
}
