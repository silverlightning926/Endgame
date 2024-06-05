import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_status.freezed.dart';
part 'tba_status.g.dart';

@freezed
class TBAStatus with _$TBAStatus {
  const factory TBAStatus({
    @JsonKey(name: "android") AppVersion? android,
    @JsonKey(name: "current_season") int? currentSeason,
    @JsonKey(name: "down_events") @Default([]) List<String> downEvents,
    @JsonKey(name: "ios") AppVersion? ios,
    @JsonKey(name: "is_datafeed_down") bool? isDatafeedDown,
    @JsonKey(name: "max_season") int? maxSeason,
  }) = _TBAStatus;

  factory TBAStatus.fromJson(Map<String, dynamic> json) =>
      _$TBAStatusFromJson(json);
}

@freezed
class AppVersion with _$AppVersion {
  const factory AppVersion({
    @JsonKey(name: "latest_app_version") int? latestAppVersion,
    @JsonKey(name: "min_app_version") int? minAppVersion,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);
}
