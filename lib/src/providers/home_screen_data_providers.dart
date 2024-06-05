import 'package:endgame/src/providers/storage_providers.dart';
import 'package:endgame/src/providers/tba_api_providers.dart';
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_data_providers.g.dart';

@riverpod
Future<List<TBAEvent>> getCurrentSeasonEvents(
    GetCurrentSeasonEventsRef ref) async {
  final TBAStatus status = await ref.watch(getStatusProvider.future);
  final int currentSeason = status.currentSeason ?? DateTime.now().year;

  final List<TBAEvent> events =
      await ref.watch(getEventsForYearProvider(currentSeason).future);

  return events
    ..sort((TBAEvent a, TBAEvent b) {
      final DateTime aStartDate = a.startDate ?? DateTime(0);
      final DateTime bStartDate = b.startDate ?? DateTime(0);
      return aStartDate.compareTo(bStartDate);
    });
}

@riverpod
Future<List<TBAEvent>> getLiveEvents(GetLiveEventsRef ref) async {
  final DateTime now = DateTime.now();
  final List<TBAEvent> events =
      await ref.watch(getCurrentSeasonEventsProvider.future);
  return events.where((TBAEvent event) {
    final DateTime startDate = event.startDate ?? DateTime(0);
    final DateTime endDate = event.endDate ?? DateTime(0);
    return startDate.isBefore(now) && endDate.isAfter(now);
  }).toList()
    ..sort((TBAEvent a, TBAEvent b) {
      final DateTime aStartDate = a.startDate ?? DateTime(0);
      final DateTime bStartDate = b.startDate ?? DateTime(0);
      return aStartDate.compareTo(bStartDate);
    });
}

@riverpod
Future<List<TBATeamSimple>> getFollowedTeams(GetFollowedTeamsRef ref) async {
  final List<String> teamKeys =
      await ref.watch(getFollowedTeamKeysProvider.future);
  final List<TBATeamSimple> teams = <TBATeamSimple>[];

  for (final String teamKey in teamKeys) {
    final TBATeamSimple? team =
        await ref.watch(getTeamSimpleProvider(teamKey).future);
    if (team != null) {
      teams.add(team);
    }
  }

  return teams
    ..sort((TBATeamSimple a, TBATeamSimple b) {
      final String aNickname = a.nickname ?? '';
      final String bNickname = b.nickname ?? '';
      return aNickname.compareTo(bNickname);
    });
}

@riverpod
Future<Map<String, List<TBAEvent>>> getEventsByDistrictForYear(
    GetEventsByDistrictForYearRef ref, int year) async {
  final List<TBAEvent> events =
      await ref.watch(getEventsForYearProvider(year).future);

  final List<District> districts =
      await ref.watch(getDistrictsForYearProvider(year).future);

  final Map<String, List<TBAEvent>> eventsByDistrict =
      <String, List<TBAEvent>>{};

  eventsByDistrict['Regional'] = events
      .where((TBAEvent event) =>
          event.eventType == 0 &&
          !districts.any((District district) => district.key == event.key))
      .toList()
    ..sort((TBAEvent a, TBAEvent b) {
      final DateTime aStartDate = a.startDate ?? DateTime(0);
      final DateTime bStartDate = b.startDate ?? DateTime(0);
      return aStartDate.compareTo(bStartDate);
    });

  eventsByDistrict['Championship'] = events
      .where((TBAEvent event) =>
          (event.eventType == 3 ||
              event.eventType == 4 ||
              event.eventType == 6) &&
          !districts.any((District district) => district.key == event.key))
      .toList()
    ..sort((TBAEvent a, TBAEvent b) {
      final DateTime aStartDate = a.startDate ?? DateTime(0);
      final DateTime bStartDate = b.startDate ?? DateTime(0);
      return aStartDate.compareTo(bStartDate);
    });

  for (final District district in districts) {
    eventsByDistrict[district.key!] = events
        .where((TBAEvent event) =>
            event.district != null && event.district!.key == district.key)
        .toList()
      ..sort((TBAEvent a, TBAEvent b) {
        final DateTime aStartDate = a.startDate ?? DateTime(0);
        final DateTime bStartDate = b.startDate ?? DateTime(0);
        return aStartDate.compareTo(bStartDate);
      });
  }

  return eventsByDistrict;
}

@riverpod
Future<List<String>> getSeasonWeeks(GetSeasonWeeksRef ref, int year) async {
  final List<TBAEvent> events =
      await ref.watch(getEventsForYearProvider(year).future);
  final List<String> weeks = <String>[];

  for (final TBAEvent event in events) {
    final int? week = event.week;
    if (week != null && !weeks.contains('Week ${week + 1}')) {
      weeks.add('Week ${week + 1}');
    }
  }

  weeks.sort();

  if (events.any((TBAEvent event) => event.eventType == 100)) {
    weeks.insert(0, 'Preseason');
  }

  if (events.any((TBAEvent event) =>
      event.eventType == 3 || event.eventType == 4 || event.eventType == 6)) {
    weeks.add('Championship');
  }

  if (events.any((TBAEvent event) => event.eventType == 99)) {
    weeks.add('Offseason');
  }

  return weeks;
}

@riverpod
Future<List<String>> getSeasons(GetSeasonsRef ref) async {
  final TBAStatus status = await ref.watch(getStatusProvider.future);
  final int currentSeason = status.currentSeason ?? DateTime.now().year;

  final List<String> seasons = <String>[];
  for (int i = currentSeason; i >= 1992; i--) {
    seasons.add(i.toString());
  }

  return seasons;
}

@riverpod
Future<void> loadHomeScreenData(LoadHomeScreenDataRef ref) async {
  await Future.wait([
    ref.watch(getCurrentSeasonEventsProvider.future),
    ref.watch(getLiveEventsProvider.future),
    ref.watch(getFollowedTeamsProvider.future),
    ref.watch(getEventsByDistrictForYearProvider(DateTime.now().year).future),
    ref.watch(getSeasonWeeksProvider(DateTime.now().year).future),
    ref.watch(getTeamsSimpleForYearProvider(DateTime.now().year, 0).future),
  ]);
}
