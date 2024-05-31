import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<List<String>> getFollowedTeams() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('followed_teams') ?? <String>[];
  }

  static Future<bool> setFollowedTeams(List<String> followedTeams) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('followed_teams', followedTeams);
  }

  static Future<bool> addFollowedTeams(String teamKey) async {
    final List<String> followedTeams = await getFollowedTeams();
    if (!followedTeams.contains(teamKey)) {
      followedTeams.add(teamKey);
    }
    return setFollowedTeams(followedTeams);
  }

  static Future<bool> removeFollowedTeams(String teamKey) async {
    final List<String> followedTeams = await getFollowedTeams();
    followedTeams.remove(teamKey);
    return setFollowedTeams(followedTeams);
  }
}
