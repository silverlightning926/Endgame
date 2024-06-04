import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_team_simple.freezed.dart';
part 'tba_team_simple.g.dart';

@freezed
class TBATeamSimple with _$TBATeamSimple {
  factory TBATeamSimple({
    required String? key,
    required int? teamNumber,
    required String? nickname,
    required String? name,
    required String? city,
    required String? stateProv,
    required String? country,
  }) = _TBATeamSimple;

  factory TBATeamSimple.fromJson(Map<String, dynamic> json) =>
      _$TBATeamSimpleFromJson(json);
}
