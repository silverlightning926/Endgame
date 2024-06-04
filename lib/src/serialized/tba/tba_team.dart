import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_team.freezed.dart';
part 'tba_team.g.dart';

@freezed
class TBATeam with _$TBATeam {
  factory TBATeam({
    required String? key,
    required int? teamNumber,
    required String? nickname,
    required String? name,
    required String? schoolName,
    required String? city,
    required String? stateProv,
    required String? country,
    required String? address,
    required String? postalCode,
    required String? gmapsPlaceId,
    required String? gmapsUrl,
    required int? lat,
    required int? lng,
    required String? locationName,
    required String? website,
    required int? rookieYear,
    required String? motto,
    required HomeChampionship? homeChampionship,
  }) = _TBATeam;

  factory TBATeam.fromJson(Map<String, dynamic> json) =>
      _$TBATeamFromJson(json);
}

@freezed
class HomeChampionship with _$HomeChampionship {
  factory HomeChampionship({required Map<String, dynamic> json}) =
      _HomeChampionship;

  factory HomeChampionship.fromJson(Map<String, dynamic> json) =>
      _$HomeChampionshipFromJson(json);
}
