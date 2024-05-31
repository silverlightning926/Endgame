class TBAMatch {
  TBAMatch({
    required this.actualTime,
    required this.alliances,
    required this.compLevel,
    required this.eventKey,
    required this.key,
    required this.matchNumber,
    required this.postResultTime,
    required this.predictedTime,
    required this.scoreBreakdown,
    required this.setNumber,
    required this.time,
    required this.videos,
    required this.winningAlliance,
  });

  final int? actualTime;
  final Alliances? alliances;
  final String? compLevel;
  final String? eventKey;
  final String? key;
  final int? matchNumber;
  final int? postResultTime;
  final int? predictedTime;
  final ScoreBreakdown? scoreBreakdown;
  final int? setNumber;
  final int? time;
  final List<Video> videos;
  final String? winningAlliance;

  factory TBAMatch.fromJson(Map<String, dynamic> json) {
    return TBAMatch(
      actualTime: json["actual_time"],
      alliances: json["alliances"] == null
          ? null
          : Alliances.fromJson(json["alliances"]),
      compLevel: json["comp_level"],
      eventKey: json["event_key"],
      key: json["key"],
      matchNumber: json["match_number"],
      postResultTime: json["post_result_time"],
      predictedTime: json["predicted_time"],
      scoreBreakdown: json["score_breakdown"] == null
          ? null
          : ScoreBreakdown.fromJson(json["score_breakdown"]),
      setNumber: json["set_number"],
      time: json["time"],
      videos: json["videos"] == null
          ? []
          : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
      winningAlliance: json["winning_alliance"],
    );
  }

  Map<String, dynamic> toJson() => {
        "actual_time": actualTime,
        "alliances": alliances?.toJson(),
        "comp_level": compLevel,
        "event_key": eventKey,
        "key": key,
        "match_number": matchNumber,
        "post_result_time": postResultTime,
        "predicted_time": predictedTime,
        "score_breakdown": scoreBreakdown?.toJson(),
        "set_number": setNumber,
        "time": time,
        "videos": videos.map((x) => x.toJson()).toList(),
        "winning_alliance": winningAlliance,
      };

  @override
  String toString() {
    return "$actualTime, $alliances, $compLevel, $eventKey, $key, $matchNumber, $postResultTime, $predictedTime, $scoreBreakdown, $setNumber, $time, $videos, $winningAlliance, ";
  }
}

class Alliances {
  Alliances({
    required this.blue,
    required this.red,
  });

  final AlliancesBlue? blue;
  final AlliancesBlue? red;

  factory Alliances.fromJson(Map<String, dynamic> json) {
    return Alliances(
      blue: json["blue"] == null ? null : AlliancesBlue.fromJson(json["blue"]),
      red: json["red"] == null ? null : AlliancesBlue.fromJson(json["red"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "blue": blue?.toJson(),
        "red": red?.toJson(),
      };

  @override
  String toString() {
    return "$blue, $red, ";
  }
}

class AlliancesBlue {
  AlliancesBlue({
    required this.dqTeamKeys,
    required this.score,
    required this.surrogateTeamKeys,
    required this.teamKeys,
  });

  final List<dynamic> dqTeamKeys;
  final int? score;
  final List<dynamic> surrogateTeamKeys;
  final List<String> teamKeys;

  factory AlliancesBlue.fromJson(Map<String, dynamic> json) {
    return AlliancesBlue(
      dqTeamKeys: json["dq_team_keys"] == null
          ? []
          : List<dynamic>.from(json["dq_team_keys"]!.map((x) => x)),
      score: json["score"],
      surrogateTeamKeys: json["surrogate_team_keys"] == null
          ? []
          : List<dynamic>.from(json["surrogate_team_keys"]!.map((x) => x)),
      teamKeys: json["team_keys"] == null
          ? []
          : List<String>.from(json["team_keys"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "dq_team_keys": dqTeamKeys.map((x) => x).toList(),
        "score": score,
        "surrogate_team_keys": surrogateTeamKeys.map((x) => x).toList(),
        "team_keys": teamKeys.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$dqTeamKeys, $score, $surrogateTeamKeys, $teamKeys, ";
  }
}

class ScoreBreakdown {
  ScoreBreakdown({
    required this.blue,
    required this.red,
  });

  final ScoreBreakdownBlue? blue;
  final ScoreBreakdownBlue? red;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) {
    return ScoreBreakdown(
      blue: json["blue"] == null
          ? null
          : ScoreBreakdownBlue.fromJson(json["blue"]),
      red:
          json["red"] == null ? null : ScoreBreakdownBlue.fromJson(json["red"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "blue": blue?.toJson(),
        "red": red?.toJson(),
      };

  @override
  String toString() {
    return "$blue, $red, ";
  }
}

class ScoreBreakdownBlue {
  ScoreBreakdownBlue({
    required this.adjustPoints,
    required this.autoAmpNoteCount,
    required this.autoAmpNotePoints,
    required this.autoLeavePoints,
    required this.autoLineRobot1,
    required this.autoLineRobot2,
    required this.autoLineRobot3,
    required this.autoPoints,
    required this.autoSpeakerNoteCount,
    required this.autoSpeakerNotePoints,
    required this.autoTotalNotePoints,
    required this.coopNotePlayed,
    required this.coopertitionBonusAchieved,
    required this.coopertitionCriteriaMet,
    required this.endGameHarmonyPoints,
    required this.endGameNoteInTrapPoints,
    required this.endGameOnStagePoints,
    required this.endGameParkPoints,
    required this.endGameRobot1,
    required this.endGameRobot2,
    required this.endGameRobot3,
    required this.endGameSpotLightBonusPoints,
    required this.endGameTotalStagePoints,
    required this.ensembleBonusAchieved,
    required this.ensembleBonusOnStageRobotsThreshold,
    required this.ensembleBonusStagePointsThreshold,
    required this.foulCount,
    required this.foulPoints,
    required this.g206Penalty,
    required this.g408Penalty,
    required this.g424Penalty,
    required this.melodyBonusAchieved,
    required this.melodyBonusThreshold,
    required this.melodyBonusThresholdCoop,
    required this.melodyBonusThresholdNonCoop,
    required this.micCenterStage,
    required this.micStageLeft,
    required this.micStageRight,
    required this.rp,
    required this.techFoulCount,
    required this.teleopAmpNoteCount,
    required this.teleopAmpNotePoints,
    required this.teleopPoints,
    required this.teleopSpeakerNoteAmplifiedCount,
    required this.teleopSpeakerNoteAmplifiedPoints,
    required this.teleopSpeakerNoteCount,
    required this.teleopSpeakerNotePoints,
    required this.teleopTotalNotePoints,
    required this.totalPoints,
    required this.trapCenterStage,
    required this.trapStageLeft,
    required this.trapStageRight,
  });

  final int? adjustPoints;
  final int? autoAmpNoteCount;
  final int? autoAmpNotePoints;
  final int? autoLeavePoints;
  final String? autoLineRobot1;
  final String? autoLineRobot2;
  final String? autoLineRobot3;
  final int? autoPoints;
  final int? autoSpeakerNoteCount;
  final int? autoSpeakerNotePoints;
  final int? autoTotalNotePoints;
  final bool? coopNotePlayed;
  final bool? coopertitionBonusAchieved;
  final bool? coopertitionCriteriaMet;
  final int? endGameHarmonyPoints;
  final int? endGameNoteInTrapPoints;
  final int? endGameOnStagePoints;
  final int? endGameParkPoints;
  final String? endGameRobot1;
  final String? endGameRobot2;
  final String? endGameRobot3;
  final int? endGameSpotLightBonusPoints;
  final int? endGameTotalStagePoints;
  final bool? ensembleBonusAchieved;
  final int? ensembleBonusOnStageRobotsThreshold;
  final int? ensembleBonusStagePointsThreshold;
  final int? foulCount;
  final int? foulPoints;
  final bool? g206Penalty;
  final bool? g408Penalty;
  final bool? g424Penalty;
  final bool? melodyBonusAchieved;
  final int? melodyBonusThreshold;
  final int? melodyBonusThresholdCoop;
  final int? melodyBonusThresholdNonCoop;
  final bool? micCenterStage;
  final bool? micStageLeft;
  final bool? micStageRight;
  final int? rp;
  final int? techFoulCount;
  final int? teleopAmpNoteCount;
  final int? teleopAmpNotePoints;
  final int? teleopPoints;
  final int? teleopSpeakerNoteAmplifiedCount;
  final int? teleopSpeakerNoteAmplifiedPoints;
  final int? teleopSpeakerNoteCount;
  final int? teleopSpeakerNotePoints;
  final int? teleopTotalNotePoints;
  final int? totalPoints;
  final bool? trapCenterStage;
  final bool? trapStageLeft;
  final bool? trapStageRight;

  factory ScoreBreakdownBlue.fromJson(Map<String, dynamic> json) {
    return ScoreBreakdownBlue(
      adjustPoints: json["adjustPoints"],
      autoAmpNoteCount: json["autoAmpNoteCount"],
      autoAmpNotePoints: json["autoAmpNotePoints"],
      autoLeavePoints: json["autoLeavePoints"],
      autoLineRobot1: json["autoLineRobot1"],
      autoLineRobot2: json["autoLineRobot2"],
      autoLineRobot3: json["autoLineRobot3"],
      autoPoints: json["autoPoints"],
      autoSpeakerNoteCount: json["autoSpeakerNoteCount"],
      autoSpeakerNotePoints: json["autoSpeakerNotePoints"],
      autoTotalNotePoints: json["autoTotalNotePoints"],
      coopNotePlayed: json["coopNotePlayed"],
      coopertitionBonusAchieved: json["coopertitionBonusAchieved"],
      coopertitionCriteriaMet: json["coopertitionCriteriaMet"],
      endGameHarmonyPoints: json["endGameHarmonyPoints"],
      endGameNoteInTrapPoints: json["endGameNoteInTrapPoints"],
      endGameOnStagePoints: json["endGameOnStagePoints"],
      endGameParkPoints: json["endGameParkPoints"],
      endGameRobot1: json["endGameRobot1"],
      endGameRobot2: json["endGameRobot2"],
      endGameRobot3: json["endGameRobot3"],
      endGameSpotLightBonusPoints: json["endGameSpotLightBonusPoints"],
      endGameTotalStagePoints: json["endGameTotalStagePoints"],
      ensembleBonusAchieved: json["ensembleBonusAchieved"],
      ensembleBonusOnStageRobotsThreshold:
          json["ensembleBonusOnStageRobotsThreshold"],
      ensembleBonusStagePointsThreshold:
          json["ensembleBonusStagePointsThreshold"],
      foulCount: json["foulCount"],
      foulPoints: json["foulPoints"],
      g206Penalty: json["g206Penalty"],
      g408Penalty: json["g408Penalty"],
      g424Penalty: json["g424Penalty"],
      melodyBonusAchieved: json["melodyBonusAchieved"],
      melodyBonusThreshold: json["melodyBonusThreshold"],
      melodyBonusThresholdCoop: json["melodyBonusThresholdCoop"],
      melodyBonusThresholdNonCoop: json["melodyBonusThresholdNonCoop"],
      micCenterStage: json["micCenterStage"],
      micStageLeft: json["micStageLeft"],
      micStageRight: json["micStageRight"],
      rp: json["rp"],
      techFoulCount: json["techFoulCount"],
      teleopAmpNoteCount: json["teleopAmpNoteCount"],
      teleopAmpNotePoints: json["teleopAmpNotePoints"],
      teleopPoints: json["teleopPoints"],
      teleopSpeakerNoteAmplifiedCount: json["teleopSpeakerNoteAmplifiedCount"],
      teleopSpeakerNoteAmplifiedPoints:
          json["teleopSpeakerNoteAmplifiedPoints"],
      teleopSpeakerNoteCount: json["teleopSpeakerNoteCount"],
      teleopSpeakerNotePoints: json["teleopSpeakerNotePoints"],
      teleopTotalNotePoints: json["teleopTotalNotePoints"],
      totalPoints: json["totalPoints"],
      trapCenterStage: json["trapCenterStage"],
      trapStageLeft: json["trapStageLeft"],
      trapStageRight: json["trapStageRight"],
    );
  }

  Map<String, dynamic> toJson() => {
        "adjustPoints": adjustPoints,
        "autoAmpNoteCount": autoAmpNoteCount,
        "autoAmpNotePoints": autoAmpNotePoints,
        "autoLeavePoints": autoLeavePoints,
        "autoLineRobot1": autoLineRobot1,
        "autoLineRobot2": autoLineRobot2,
        "autoLineRobot3": autoLineRobot3,
        "autoPoints": autoPoints,
        "autoSpeakerNoteCount": autoSpeakerNoteCount,
        "autoSpeakerNotePoints": autoSpeakerNotePoints,
        "autoTotalNotePoints": autoTotalNotePoints,
        "coopNotePlayed": coopNotePlayed,
        "coopertitionBonusAchieved": coopertitionBonusAchieved,
        "coopertitionCriteriaMet": coopertitionCriteriaMet,
        "endGameHarmonyPoints": endGameHarmonyPoints,
        "endGameNoteInTrapPoints": endGameNoteInTrapPoints,
        "endGameOnStagePoints": endGameOnStagePoints,
        "endGameParkPoints": endGameParkPoints,
        "endGameRobot1": endGameRobot1,
        "endGameRobot2": endGameRobot2,
        "endGameRobot3": endGameRobot3,
        "endGameSpotLightBonusPoints": endGameSpotLightBonusPoints,
        "endGameTotalStagePoints": endGameTotalStagePoints,
        "ensembleBonusAchieved": ensembleBonusAchieved,
        "ensembleBonusOnStageRobotsThreshold":
            ensembleBonusOnStageRobotsThreshold,
        "ensembleBonusStagePointsThreshold": ensembleBonusStagePointsThreshold,
        "foulCount": foulCount,
        "foulPoints": foulPoints,
        "g206Penalty": g206Penalty,
        "g408Penalty": g408Penalty,
        "g424Penalty": g424Penalty,
        "melodyBonusAchieved": melodyBonusAchieved,
        "melodyBonusThreshold": melodyBonusThreshold,
        "melodyBonusThresholdCoop": melodyBonusThresholdCoop,
        "melodyBonusThresholdNonCoop": melodyBonusThresholdNonCoop,
        "micCenterStage": micCenterStage,
        "micStageLeft": micStageLeft,
        "micStageRight": micStageRight,
        "rp": rp,
        "techFoulCount": techFoulCount,
        "teleopAmpNoteCount": teleopAmpNoteCount,
        "teleopAmpNotePoints": teleopAmpNotePoints,
        "teleopPoints": teleopPoints,
        "teleopSpeakerNoteAmplifiedCount": teleopSpeakerNoteAmplifiedCount,
        "teleopSpeakerNoteAmplifiedPoints": teleopSpeakerNoteAmplifiedPoints,
        "teleopSpeakerNoteCount": teleopSpeakerNoteCount,
        "teleopSpeakerNotePoints": teleopSpeakerNotePoints,
        "teleopTotalNotePoints": teleopTotalNotePoints,
        "totalPoints": totalPoints,
        "trapCenterStage": trapCenterStage,
        "trapStageLeft": trapStageLeft,
        "trapStageRight": trapStageRight,
      };

  @override
  String toString() {
    return "$adjustPoints, $autoAmpNoteCount, $autoAmpNotePoints, $autoLeavePoints, $autoLineRobot1, $autoLineRobot2, $autoLineRobot3, $autoPoints, $autoSpeakerNoteCount, $autoSpeakerNotePoints, $autoTotalNotePoints, $coopNotePlayed, $coopertitionBonusAchieved, $coopertitionCriteriaMet, $endGameHarmonyPoints, $endGameNoteInTrapPoints, $endGameOnStagePoints, $endGameParkPoints, $endGameRobot1, $endGameRobot2, $endGameRobot3, $endGameSpotLightBonusPoints, $endGameTotalStagePoints, $ensembleBonusAchieved, $ensembleBonusOnStageRobotsThreshold, $ensembleBonusStagePointsThreshold, $foulCount, $foulPoints, $g206Penalty, $g408Penalty, $g424Penalty, $melodyBonusAchieved, $melodyBonusThreshold, $melodyBonusThresholdCoop, $melodyBonusThresholdNonCoop, $micCenterStage, $micStageLeft, $micStageRight, $rp, $techFoulCount, $teleopAmpNoteCount, $teleopAmpNotePoints, $teleopPoints, $teleopSpeakerNoteAmplifiedCount, $teleopSpeakerNoteAmplifiedPoints, $teleopSpeakerNoteCount, $teleopSpeakerNotePoints, $teleopTotalNotePoints, $totalPoints, $trapCenterStage, $trapStageLeft, $trapStageRight, ";
  }
}

class Video {
  Video({
    required this.key,
    required this.type,
  });

  final String? key;
  final String? type;

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      key: json["key"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
      };

  @override
  String toString() {
    return "$key, $type, ";
  }
}
