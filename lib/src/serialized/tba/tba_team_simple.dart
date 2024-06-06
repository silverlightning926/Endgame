import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_team_simple.freezed.dart';
part 'tba_team_simple.g.dart';

@freezed
class TBATeamSimple with _$TBATeamSimple {
  const factory TBATeamSimple({
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "nickname") String? nickname,
    @JsonKey(name: "state_prov") String? stateProv,
    @JsonKey(name: "team_number") int? teamNumber,
  }) = _TBATeamSimple;

  factory TBATeamSimple.fromJson(Map<String, dynamic> json) =>
      _$TBATeamSimpleFromJson(json);
}
