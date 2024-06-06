import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_team.freezed.dart';
part 'tba_team.g.dart';

@freezed
class TBATeam with _$TBATeam {
  const factory TBATeam({
    @JsonKey(name: "address") dynamic address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "gmaps_place_id") dynamic gmapsPlaceId,
    @JsonKey(name: "gmaps_url") dynamic gmapsUrl,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "lat") dynamic lat,
    @JsonKey(name: "lng") dynamic lng,
    @JsonKey(name: "location_name") dynamic locationName,
    @JsonKey(name: "motto") dynamic motto,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "nickname") String? nickname,
    @JsonKey(name: "postal_code") String? postalCode,
    @JsonKey(name: "rookie_year") int? rookieYear,
    @JsonKey(name: "school_name") String? schoolName,
    @JsonKey(name: "state_prov") String? stateProv,
    @JsonKey(name: "team_number") int? teamNumber,
    @JsonKey(name: "website") String? website,
  }) = _TBATeam;

  factory TBATeam.fromJson(Map<String, dynamic> json) =>
      _$TBATeamFromJson(json);
}
