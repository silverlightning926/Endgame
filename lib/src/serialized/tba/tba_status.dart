import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_status.freezed.dart';
part 'tba_status.g.dart';

@freezed
class TBAStatus with _$TBAStatus {
  factory TBAStatus({
    required AppVersion? android,
    required int? currentSeason,
    required List<dynamic> downEvents,
    required AppVersion? ios,
    required bool? isDatafeedDown,
    required int? maxSeason,
  }) = _TBAStatus;

  factory TBAStatus.fromJson(Map<String, dynamic> json) =>
      _$TBAStatusFromJson(json);
}

@freezed
class AppVersion with _$AppVersion {
  factory AppVersion({
    required int? latestAppVersion,
    required int? minAppVersion,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);
}
