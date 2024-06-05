import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_match_simple.freezed.dart';
part 'tba_match_simple.g.dart';

@freezed
class TBAMatchSimple with _$TBAMatchSimple {
  const factory TBAMatchSimple({
    @JsonKey(name: "actual_time") int? actualTime,
    @JsonKey(name: "alliances") Alliances? alliances,
    @JsonKey(name: "comp_level") CompLevel? compLevel,
    @JsonKey(name: "event_key") String? eventKey,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "match_number") int? matchNumber,
    @JsonKey(name: "predicted_time") int? predictedTime,
    @JsonKey(name: "set_number") int? setNumber,
    @JsonKey(name: "time") int? time,
    @JsonKey(name: "winning_alliance") WinningAlliance? winningAlliance,
  }) = _TBAMatchSimple;

  factory TBAMatchSimple.fromJson(Map<String, dynamic> json) =>
      _$TBAMatchSimpleFromJson(json);
}

@freezed
class Alliances with _$Alliances {
  const factory Alliances({
    @JsonKey(name: "blue") AllianceData? blue,
    @JsonKey(name: "red") AllianceData? red,
  }) = _Alliances;

  factory Alliances.fromJson(Map<String, dynamic> json) =>
      _$AlliancesFromJson(json);
}

@freezed
class AllianceData with _$AllianceData {
  const factory AllianceData({
    @JsonKey(name: "dq_team_keys") @Default([]) List<String> dqTeamKeys,
    @JsonKey(name: "score") int? score,
    @JsonKey(name: "surrogate_team_keys")
    @Default([])
    List<String> surrogateTeamKeys,
    @JsonKey(name: "team_keys") @Default([]) List<String> teamKeys,
  }) = _AllianceData;

  factory AllianceData.fromJson(Map<String, dynamic> json) =>
      _$AllianceDataFromJson(json);
}

enum CompLevel {
  @JsonValue("f")
  f,
  @JsonValue("qf")
  qf,
  @JsonValue("qm")
  qm,
  @JsonValue("sf")
  sf
}

enum WinningAlliance {
  @JsonValue("blue")
  blue,
  @JsonValue("")
  empty,
  @JsonValue("red")
  red
}
