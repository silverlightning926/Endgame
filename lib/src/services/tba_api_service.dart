import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:endgame/src/services/api_secrets.dart';

class TBAAPIService {
  static const String _baseUrl = 'https://www.thebluealliance.com/api/v3';

  static Future<T> _getRequest<T>(
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

  static Future<TBAStatus> getStatus() async {
    const String url = '$_baseUrl/status';
    return _getRequest(url, (json) => TBAStatus.fromJson(json));
  }

  static Future<TBATeamSimple> getTeamSimple(String teamKey) async {
    final String url = '$_baseUrl/team/$teamKey/simple';
    return _getRequest(url, (json) => TBATeamSimple.fromJson(json));
  }

  static Future<TBATeam> getTeam(String teamKey) async {
    final String url = '$_baseUrl/team/$teamKey';
    return _getRequest(url, (json) => TBATeam.fromJson(json));
  }

  static Future<List<TBAMatch>> getTeamMatchesForYear(
      String teamKey, int year) async {
    final String url = '$_baseUrl/team/$teamKey/matches/$year/simple';
    return _getRequest(url, (json) {
      final List<dynamic> matches = json;
      return matches.map((dynamic match) => TBAMatch.fromJson(match)).toList();
    });
  }

  static Future<List<District>> getDistrictsForYear(int year) async {
    final String url = '$_baseUrl/districts/$year';
    return _getRequest(url, (json) {
      final List<dynamic> districts = json;
      return districts
          .map((dynamic district) => District.fromJson(district))
          .toList();
    });
  }

  static Future<List<TBAEvent>> getEventsForYear(int year) async {
    final String url = '$_baseUrl/events/$year';
    return _getRequest(url, (json) {
      final List<dynamic> events = json;
      return events.map((dynamic event) => TBAEvent.fromJson(event)).toList();
    });
  }

  static Future<List<TBATeamSimple>> getTeamsSimple(int pageNum) async {
    final String url = '$_baseUrl/teams/$pageNum/simple';
    return _getRequest(url, (json) {
      final List<dynamic> teams = json;
      return teams.map((dynamic team) => TBATeamSimple.fromJson(team)).toList();
    });
  }
}
