import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_event.freezed.dart';
part 'tba_event.g.dart';

@freezed
class TBAEvent with _$TBAEvent {
  const factory TBAEvent({
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "district") District? district,
    @JsonKey(name: "division_keys") @Default([]) List<String> divisionKeys,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "event_code") String? eventCode,
    @JsonKey(name: "event_type") int? eventType,
    @JsonKey(name: "event_type_string") String? eventTypeString,
    @JsonKey(name: "first_event_code") String? firstEventCode,
    @JsonKey(name: "first_event_id") dynamic firstEventId,
    @JsonKey(name: "gmaps_place_id") String? gmapsPlaceId,
    @JsonKey(name: "gmaps_url") String? gmapsUrl,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "lng") double? lng,
    @JsonKey(name: "location_name") String? locationName,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "parent_event_key") dynamic parentEventKey,
    @JsonKey(name: "playoff_type") int? playoffType,
    @JsonKey(name: "playoff_type_string") dynamic playoffTypeString,
    @JsonKey(name: "postal_code") String? postalCode,
    @JsonKey(name: "short_name") String? shortName,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "state_prov") String? stateProv,
    @JsonKey(name: "timezone") String? timezone,
    @JsonKey(name: "webcasts") @Default([]) List<Webcast> webcasts,
    @JsonKey(name: "website") String? website,
    @JsonKey(name: "week") int? week,
    @JsonKey(name: "year") int? year,
  }) = _TBAEvent;

  factory TBAEvent.fromJson(Map<String, dynamic> json) =>
      _$TBAEventFromJson(json);
}

@freezed
class District with _$District {
  const factory District({
    @JsonKey(name: "abbreviation") String? abbreviation,
    @JsonKey(name: "display_name") String? displayName,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "year") int? year,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Webcast with _$Webcast {
  const factory Webcast({
    @JsonKey(name: "channel") String? channel,
    @JsonKey(name: "type") String? type,
  }) = _Webcast;

  factory Webcast.fromJson(Map<String, dynamic> json) =>
      _$WebcastFromJson(json);
}
