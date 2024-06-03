class TBATeam {
  TBATeam({
    required this.address,
    required this.city,
    required this.country,
    required this.gmapsPlaceId,
    required this.gmapsUrl,
    required this.key,
    required this.lat,
    required this.lng,
    required this.locationName,
    required this.motto,
    required this.name,
    required this.nickname,
    required this.postalCode,
    required this.rookieYear,
    required this.schoolName,
    required this.stateProv,
    required this.teamNumber,
    required this.website,
  });

  final dynamic address;
  final String? city;
  final String? country;
  final dynamic gmapsPlaceId;
  final dynamic gmapsUrl;
  final String? key;
  final dynamic lat;
  final dynamic lng;
  final dynamic locationName;
  final dynamic motto;
  final String? name;
  final String? nickname;
  final String? postalCode;
  final int? rookieYear;
  final String? schoolName;
  final String? stateProv;
  final int? teamNumber;
  final String? website;

  factory TBATeam.fromJson(Map<String, dynamic> json) {
    return TBATeam(
      address: json["address"],
      city: json["city"],
      country: json["country"],
      gmapsPlaceId: json["gmaps_place_id"],
      gmapsUrl: json["gmaps_url"],
      key: json["key"],
      lat: json["lat"],
      lng: json["lng"],
      locationName: json["location_name"],
      motto: json["motto"],
      name: json["name"],
      nickname: json["nickname"],
      postalCode: json["postal_code"],
      rookieYear: json["rookie_year"],
      schoolName: json["school_name"],
      stateProv: json["state_prov"],
      teamNumber: json["team_number"],
      website: json["website"],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "country": country,
        "gmaps_place_id": gmapsPlaceId,
        "gmaps_url": gmapsUrl,
        "key": key,
        "lat": lat,
        "lng": lng,
        "location_name": locationName,
        "motto": motto,
        "name": name,
        "nickname": nickname,
        "postal_code": postalCode,
        "rookie_year": rookieYear,
        "school_name": schoolName,
        "state_prov": stateProv,
        "team_number": teamNumber,
        "website": website,
      };

  @override
  String toString() {
    return "$address, $city, $country, $gmapsPlaceId, $gmapsUrl, $key, $lat, $lng, $locationName, $motto, $name, $nickname, $postalCode, $rookieYear, $schoolName, $stateProv, $teamNumber, $website, ";
  }
}
