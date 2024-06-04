class TBATeamSimple {
  TBATeamSimple({
    required this.key,
    required this.teamNumber,
    required this.nickname,
    required this.name,
    required this.city,
    required this.stateProv,
    required this.country,
  });

  final String? key;
  final int? teamNumber;
  final String? nickname;
  final String? name;
  final String? city;
  final String? stateProv;
  final String? country;

  factory TBATeamSimple.fromJson(Map<String, dynamic> json) {
    return TBATeamSimple(
      key: json["key"],
      teamNumber: json["team_number"],
      nickname: json["nickname"],
      name: json["name"],
      city: json["city"],
      stateProv: json["state_prov"],
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "team_number": teamNumber,
        "nickname": nickname,
        "name": name,
        "city": city,
        "state_prov": stateProv,
        "country": country,
      };

  @override
  String toString() {
    return "$key, $teamNumber, $nickname, $name, $city, $stateProv, $country, ";
  }
}
