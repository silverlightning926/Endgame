import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_providers.g.dart';

@riverpod
Future<List<String>> getFollowedTeamKeys(GetFollowedTeamKeysRef ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('followed_teams') ?? <String>[];
}

@riverpod
Future<bool> setFollowedTeamKeys(
    SetFollowedTeamKeysRef ref, List<String> followedTeams) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setStringList('followed_teams', followedTeams);
}

@riverpod
Future<bool> addFollowedTeamKey(
    AddFollowedTeamKeyRef ref, String teamKey) async {
  final List<String> followedTeams =
      await ref.read(getFollowedTeamKeysProvider.future);
  if (!followedTeams.contains(teamKey)) {
    followedTeams.add(teamKey);
  }
  return ref.read(setFollowedTeamKeysProvider(followedTeams).future);
}

@riverpod
Future<bool> removeFollowedTeamKey(
    RemoveFollowedTeamKeyRef ref, String teamKey) async {
  final List<String> followedTeams =
      await ref.read(getFollowedTeamKeysProvider.future);
  followedTeams.remove(teamKey);
  return ref.watch(setFollowedTeamKeysProvider(followedTeams).future);
}
