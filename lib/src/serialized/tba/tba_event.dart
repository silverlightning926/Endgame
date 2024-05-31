class TBAEvent {
  TBAEvent({
    required this.address,
    required this.city,
    required this.country,
    required this.district,
    required this.divisionKeys,
    required this.endDate,
    required this.eventCode,
    required this.eventType,
    required this.eventTypeString,
    required this.firstEventCode,
    required this.firstEventId,
    required this.gmapsPlaceId,
    required this.gmapsUrl,
    required this.key,
    required this.lat,
    required this.lng,
    required this.locationName,
    required this.name,
    required this.parentEventKey,
    required this.playoffType,
    required this.playoffTypeString,
    required this.postalCode,
    required this.shortName,
    required this.startDate,
    required this.stateProv,
    required this.timezone,
    required this.webcasts,
    required this.website,
    required this.week,
    required this.year,
  });

  final String? address;
  final String? city;
  final String? country;
  final District? district;
  final List<String> divisionKeys;
  final DateTime? endDate;
  final String? eventCode;
  final int? eventType;
  final String? eventTypeString;
  final String? firstEventCode;
  final dynamic firstEventId;
  final String? gmapsPlaceId;
  final String? gmapsUrl;
  final String? key;
  final double? lat;
  final double? lng;
  final String? locationName;
  final String? name;
  final String? parentEventKey;
  final int? playoffType;
  final String? playoffTypeString;
  final String? postalCode;
  final String? shortName;
  final DateTime? startDate;
  final String? stateProv;
  final String? timezone;
  final List<Webcast> webcasts;
  final String? website;
  final int? week;
  final int? year;

  factory TBAEvent.fromJson(Map<String, dynamic> json) {
    return TBAEvent(
      address: json["address"],
      city: json["city"],
      country: json["country"],
      district:
          json["district"] == null ? null : District.fromJson(json["district"]),
      divisionKeys: json["division_keys"] == null
          ? []
          : List<String>.from(json["division_keys"]!.map((x) => x)),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      eventCode: json["event_code"],
      eventType: json["event_type"],
      eventTypeString: json["event_type_string"],
      firstEventCode: json["first_event_code"],
      firstEventId: json["first_event_id"],
      gmapsPlaceId: json["gmaps_place_id"],
      gmapsUrl: json["gmaps_url"],
      key: json["key"],
      lat: json["lat"],
      lng: json["lng"],
      locationName: json["location_name"],
      name: json["name"],
      parentEventKey: json["parent_event_key"],
      playoffType: json["playoff_type"],
      playoffTypeString: json["playoff_type_string"],
      postalCode: json["postal_code"],
      shortName: json["short_name"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      stateProv: json["state_prov"],
      timezone: json["timezone"],
      webcasts: json["webcasts"] == null
          ? []
          : List<Webcast>.from(
              json["webcasts"]!.map((x) => Webcast.fromJson(x))),
      website: json["website"],
      week: json["week"],
      year: json["year"],
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "country": country,
        "district": district?.toJson(),
        "division_keys": divisionKeys.map((x) => x).toList(),
        "end_date": endDate,
        "event_code": eventCode,
        "event_type": eventType,
        "event_type_string": eventTypeString,
        "first_event_code": firstEventCode,
        "first_event_id": firstEventId,
        "gmaps_place_id": gmapsPlaceId,
        "gmaps_url": gmapsUrl,
        "key": key,
        "lat": lat,
        "lng": lng,
        "location_name": locationName,
        "name": name,
        "parent_event_key": parentEventKey,
        "playoff_type": playoffType,
        "playoff_type_string": playoffTypeString,
        "postal_code": postalCode,
        "short_name": shortName,
        "start_date": startDate,
        "state_prov": stateProv,
        "timezone": timezone,
        "webcasts": webcasts.map((x) => x.toJson()).toList(),
        "website": website,
        "week": week,
        "year": year,
      };

  @override
  String toString() {
    return "$address, $city, $country, $district, $divisionKeys, $endDate, $eventCode, $eventType, $eventTypeString, $firstEventCode, $firstEventId, $gmapsPlaceId, $gmapsUrl, $key, $lat, $lng, $locationName, $name, $parentEventKey, $playoffType, $playoffTypeString, $postalCode, $shortName, $startDate, $stateProv, $timezone, $webcasts, $website, $week, $year, ";
  }
}

class District {
  District({
    required this.abbreviation,
    required this.displayName,
    required this.key,
    required this.year,
  });

  final String? abbreviation;
  final String? displayName;
  final String? key;
  final int? year;

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      abbreviation: json["abbreviation"],
      displayName: json["display_name"],
      key: json["key"],
      year: json["year"],
    );
  }

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
        "display_name": displayName,
        "key": key,
        "year": year,
      };

  @override
  String toString() {
    return "$abbreviation, $displayName, $key, $year, ";
  }
}

class Webcast {
  Webcast({
    required this.channel,
    required this.type,
    required this.date,
  });

  final String? channel;
  final String? type;
  final String? date;

  factory Webcast.fromJson(Map<String, dynamic> json) {
    return Webcast(
      channel: json["channel"],
      type: json["type"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "type": type,
        "date": date,
      };

  @override
  String toString() {
    return "$channel, $type, $date, ";
  }
}
