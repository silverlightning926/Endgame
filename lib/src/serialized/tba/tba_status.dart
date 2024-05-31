class TBAStatus {
  TBAStatus({
    required this.android,
    required this.currentSeason,
    required this.downEvents,
    required this.ios,
    required this.isDatafeedDown,
    required this.maxSeason,
  });

  final AppVersion? android;
  final int? currentSeason;
  final List<dynamic> downEvents;
  final AppVersion? ios;
  final bool? isDatafeedDown;
  final int? maxSeason;

  factory TBAStatus.fromJson(Map<String, dynamic> json) {
    return TBAStatus(
      android:
          json["android"] == null ? null : AppVersion.fromJson(json["android"]),
      currentSeason: json["current_season"],
      downEvents: json["down_events"] == null
          ? []
          : List<dynamic>.from(json["down_events"]!.map((x) => x)),
      ios: json["ios"] == null ? null : AppVersion.fromJson(json["ios"]),
      isDatafeedDown: json["is_datafeed_down"],
      maxSeason: json["max_season"],
    );
  }

  Map<String, dynamic> toJson() => {
        "android": android?.toJson(),
        "current_season": currentSeason,
        "down_events": downEvents.map((x) => x).toList(),
        "ios": ios?.toJson(),
        "is_datafeed_down": isDatafeedDown,
        "max_season": maxSeason,
      };

  @override
  String toString() {
    return "$android, $currentSeason, $downEvents, $ios, $isDatafeedDown, $maxSeason, ";
  }
}

class AppVersion {
  AppVersion({
    required this.latestAppVersion,
    required this.minAppVersion,
  });

  final int? latestAppVersion;
  final int? minAppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) {
    return AppVersion(
      latestAppVersion: json["latest_app_version"],
      minAppVersion: json["min_app_version"],
    );
  }

  Map<String, dynamic> toJson() => {
        "latest_app_version": latestAppVersion,
        "min_app_version": minAppVersion,
      };

  @override
  String toString() {
    return "$latestAppVersion, $minAppVersion, ";
  }
}
