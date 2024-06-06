import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_match_simple.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:endgame/src/providers/api_secrets.dart';

part 'tba_api_providers.g.dart';

Future<T> _getRequest<T>(
  String url,
  T Function(dynamic json) fromJson,
) async {
  final http.Response response = await http.get(
    Uri.parse(url),
    headers: <String, String>{'X-TBA-Auth-Key': ApiSecrets.tbaKey},
  );

  if (response.statusCode == 200) {
    return fromJson(jsonDecode(response.body));
  } else {
    throw HttpException('Failed to load data: ${response.statusCode}');
  }
}

@riverpod
Future<TBAStatus> getStatus(GetStatusRef ref) async {
  const String url = 'https://www.thebluealliance.com/api/v3/status';
  return _getRequest(url, (json) => TBAStatus.fromJson(json));
}

@riverpod
Future<TBATeamSimple> getTeamSimple(
    GetTeamSimpleRef ref, String teamKey) async {
  final String url =
      'https://www.thebluealliance.com/api/v3/team/$teamKey/simple';
  return _getRequest(url, (json) => TBATeamSimple.fromJson(json));
}

@riverpod
Future<TBATeam> getTeam(GetTeamRef ref, String teamKey) async {
  final String url = 'https://www.thebluealliance.com/api/v3/team/$teamKey';
  return _getRequest(url, (json) => TBATeam.fromJson(json));
}

@riverpod
Future<List<TBAMatchSimple>> getTeamMatchesForYear(
    GetTeamMatchesForYearRef ref, String teamKey, int year) async {
  final String url =
      'https://www.thebluealliance.com/api/v3/team/$teamKey/matches/$year/simple';

  return _getRequest(url, (json) {
    final List<dynamic> matches = json;
    return matches
        .map((dynamic match) => TBAMatchSimple.fromJson(match))
        .toList();
  });
}

@riverpod
Future<List<District>> getDistrictsForYear(
    GetDistrictsForYearRef ref, int year) async {
  final String url = 'https://www.thebluealliance.com/api/v3/districts/$year';
  return _getRequest(url, (json) {
    final List<dynamic> districts = json;
    return districts
        .map((dynamic district) => District.fromJson(district))
        .toList();
  });
}

@riverpod
Future<List<TBAEvent>> getEventsForYear(
    GetEventsForYearRef ref, int year) async {
  final String url = 'https://www.thebluealliance.com/api/v3/events/$year';
  return _getRequest(url, (json) {
    final List<dynamic> events = json;
    return events.map((dynamic event) => TBAEvent.fromJson(event)).toList();
  });
}

@riverpod
Future<List<TBATeamSimple>> getTeamsSimpleForYear(
    GetTeamsSimpleForYearRef ref, int year, int page) async {
  final String url =
      'https://www.thebluealliance.com/api/v3/teams/$year/$page/simple';

  return _getRequest(url, (json) {
    final List<dynamic> teams = json;
    return teams.map((dynamic team) => TBATeamSimple.fromJson(team)).toList();
  });
}
