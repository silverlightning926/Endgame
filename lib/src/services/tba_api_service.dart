//get tba key from api_secrets.dart
import 'dart:convert';
import 'dart:io';

import 'package:endgame/src/serialized/tba/tba_event.dart';
import 'package:endgame/src/serialized/tba/tba_match.dart';
import 'package:endgame/src/serialized/tba/tba_status.dart';
import 'package:endgame/src/serialized/tba/tba_team.dart';
import 'package:endgame/src/serialized/tba/tba_team_simple.dart';
import 'package:endgame/src/services/api_secrets.dart';
import 'package:http/http.dart' as http;

class TBAAPIService {
  static const String _baseUrl = 'https://www.thebluealliance.com/api/v3';

  static Future<TBAStatus> getStatus() async {
    const String url = '$_baseUrl/status';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      return TBAStatus.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw const HttpException('Failed to load status');
    }
  }

  static Future<TBATeamSimple> getTeamSimple(String teamKey) async {
    final String url = '$_baseUrl/team/$teamKey/simple';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      return TBATeamSimple.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw const HttpException('Failed to load team');
    }
  }

  static Future<TBATeam> getTeam(String teamKey) async {
    final String url = '$_baseUrl/team/$teamKey';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      return TBATeam.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw const HttpException('Failed to load team');
    }
  }

  static Future<List<TBAMatch>> getTeamMatchesForYear(
      String teamKey, int year) async {
    final String url = '$_baseUrl/team/$teamKey/matches/$year/simple';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> matches = jsonDecode(response.body);
      return matches.map((dynamic match) => TBAMatch.fromJson(match)).toList();
    } else {
      throw const HttpException('Failed to load team matches');
    }
  }

  static Future<List<District>> getDistrictsForYear(int year) async {
    final String url = '$_baseUrl/districts/$year';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> districts = jsonDecode(response.body);
      return districts
          .map((dynamic district) => District.fromJson(district))
          .toList();
    } else {
      throw const HttpException('Failed to load districts');
    }
  }

  static Future<List<TBAEvent>> getEventsForYear(int year) async {
    final String url = '$_baseUrl/events/$year';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> events = jsonDecode(response.body);
      return events.map((dynamic event) => TBAEvent.fromJson(event)).toList();
    } else {
      throw const HttpException('Failed to load events');
    }
  }

  static Future<List<TBATeamSimple>> getTeamsSimple(int pageNum) async {
    final String url = '$_baseUrl/teams/$pageNum/simple';
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'X-TBA-Auth-Key': ApiSecrets.tbaKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> teams = jsonDecode(response.body);
      return teams.map((dynamic team) => TBATeamSimple.fromJson(team)).toList();
    } else {
      throw const HttpException('Failed to load teams');
    }
  }
}
