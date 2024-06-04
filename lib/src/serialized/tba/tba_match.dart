import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_match.freezed.dart';
part 'tba_match.g.dart';

@freezed
class TBAMatch with _$TBAMatch {
  factory TBAMatch({
    required int? actualTime,
    required Alliances? alliances,
    required String? compLevel,
    required String? eventKey,
    required String? key,
    required int? matchNumber,
    required int? postResultTime,
    required int? predictedTime,
    required ScoreBreakdown? scoreBreakdown,
    required int? setNumber,
    required int? time,
    required List<Video> videos,
    required String? winningAlliance,
  }) = _TBAMatch;

  factory TBAMatch.fromJson(Map<String, dynamic> json) =>
      _$TBAMatchFromJson(json);
}

@freezed
class Alliances with _$Alliances {
  factory Alliances({
    required AlliancesBlue? blue,
    required AlliancesBlue? red,
  }) = _Alliances;

  factory Alliances.fromJson(Map<String, dynamic> json) =>
      _$AlliancesFromJson(json);
}

@freezed
class AlliancesBlue with _$AlliancesBlue {
  factory AlliancesBlue({
    required List<dynamic> dqTeamKeys,
    required int? score,
    required List<dynamic> surrogateTeamKeys,
    required List<String> teamKeys,
  }) = _AlliancesBlue;

  factory AlliancesBlue.fromJson(Map<String, dynamic> json) =>
      _$AlliancesBlueFromJson(json);
}

@freezed
class ScoreBreakdown with _$ScoreBreakdown {
  factory ScoreBreakdown({
    required ScoreBreakdownBlue? blue,
    required ScoreBreakdownBlue? red,
  }) = _ScoreBreakdown;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) =>
      _$ScoreBreakdownFromJson(json);
}

@freezed
class ScoreBreakdownBlue with _$ScoreBreakdownBlue {
  factory ScoreBreakdownBlue({
    required int? adjustPoints,
    required int? autoAmpNoteCount,
    required int? autoAmpNotePoints,
    required int? autoLeavePoints,
    required String? autoLineRobot1,
    required String? autoLineRobot2,
    required String? autoLineRobot3,
    required int? autoPoints,
    required int? autoSpeakerNoteCount,
    required int? autoSpeakerNotePoints,
    required int? autoTotalNotePoints,
    required bool? coopNotePlayed,
    required bool? coopertitionBonusAchieved,
    required bool? coopertitionCriteriaMet,
    required int? endGameHarmonyPoints,
    required int? endGameNoteInTrapPoints,
    required int? endGameOnStagePoints,
    required int? endGameParkPoints,
    required String? endGameRobot1,
    required String? endGameRobot2,
    required String? endGameRobot3,
    required int? endGameSpotLightBonusPoints,
    required int? endGameTotalStagePoints,
    required bool? ensembleBonusAchieved,
    required int? ensembleBonusOnStageRobotsThreshold,
    required int? ensembleBonusStagePointsThreshold,
    required int? foulCount,
    required int? foulPoints,
    required bool? g206Penalty,
    required bool? g408Penalty,
    required bool? g424Penalty,
    required bool? melodyBonusAchieved,
    required int? melodyBonusThreshold,
    required int? melodyBonusThresholdCoop,
    required int? melodyBonusThresholdNonCoop,
    required bool? micCenterStage,
    required bool? micStageLeft,
    required bool? micStageRight,
    required int? rp,
    required int? techFoulCount,
    required int? teleopAmpNoteCount,
    required int? teleopAmpNotePoints,
    required int? teleopPoints,
    required int? teleopSpeakerNoteAmplifiedCount,
    required int? teleopSpeakerNoteAmplifiedPoints,
    required int? teleopSpeakerNoteCount,
    required int? teleopSpeakerNotePoints,
    required int? teleopTotalNotePoints,
    required int? totalPoints,
    required bool? trapCenterStage,
    required bool? trapStageLeft,
    required bool? trapStageRight,
  }) = _ScoreBreakdownBlue;

  factory ScoreBreakdownBlue.fromJson(Map<String, dynamic> json) =>
      _$ScoreBreakdownBlueFromJson(json);
}

@freezed
class Video with _$Video {
  factory Video({
    required String? key,
    required String? type,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
