class TBATeam {
  TBATeam({
    required this.key,
    required this.teamNumber,
    required this.nickname,
    required this.name,
    required this.schoolName,
    required this.city,
    required this.stateProv,
    required this.country,
    required this.address,
    required this.postalCode,
    required this.gmapsPlaceId,
    required this.gmapsUrl,
    required this.lat,
    required this.lng,
    required this.locationName,
    required this.website,
    required this.rookieYear,
    required this.motto,
    required this.homeChampionship,
  });

  final String? key;
  final int? teamNumber;
  final String? nickname;
  final String? name;
  final String? schoolName;
  final String? city;
  final String? stateProv;
  final String? country;
  final String? address;
  final String? postalCode;
  final String? gmapsPlaceId;
  final String? gmapsUrl;
  final int? lat;
  final int? lng;
  final String? locationName;
  final String? website;
  final int? rookieYear;
  final String? motto;
  final HomeChampionship? homeChampionship;

  factory TBATeam.fromJson(Map<String, dynamic> json) {
    return TBATeam(
      key: json["key"],
      teamNumber: json["team_number"],
      nickname: json["nickname"],
      name: json["name"],
      schoolName: json["school_name"],
      city: json["city"],
      stateProv: json["state_prov"],
      country: json["country"],
      address: json["address"],
      postalCode: json["postal_code"],
      gmapsPlaceId: json["gmaps_place_id"],
      gmapsUrl: json["gmaps_url"],
      lat: json["lat"],
      lng: json["lng"],
      locationName: json["location_name"],
      website: json["website"],
      rookieYear: json["rookie_year"],
      motto: json["motto"],
      homeChampionship: json["home_championship"] == null
          ? null
          : HomeChampionship.fromJson(json["home_championship"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "team_number": teamNumber,
        "nickname": nickname,
        "name": name,
        "school_name": schoolName,
        "city": city,
        "state_prov": stateProv,
        "country": country,
        "address": address,
        "postal_code": postalCode,
        "gmaps_place_id": gmapsPlaceId,
        "gmaps_url": gmapsUrl,
        "lat": lat,
        "lng": lng,
        "location_name": locationName,
        "website": website,
        "rookie_year": rookieYear,
        "motto": motto,
        "home_championship": homeChampionship?.toJson(),
      };

  @override
  String toString() {
    return "$key, $teamNumber, $nickname, $name, $schoolName, $city, $stateProv, $country, $address, $postalCode, $gmapsPlaceId, $gmapsUrl, $lat, $lng, $locationName, $website, $rookieYear, $motto, $homeChampionship, ";
  }
}

class HomeChampionship {
  HomeChampionship({required this.json});
  final Map<String, dynamic> json;

  factory HomeChampionship.fromJson(Map<String, dynamic> json) {
    return HomeChampionship(json: json);
  }

  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return "";
  }
}
