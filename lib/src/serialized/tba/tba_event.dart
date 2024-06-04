import 'package:freezed_annotation/freezed_annotation.dart';

part 'tba_event.freezed.dart';
part 'tba_event.g.dart';

@freezed
class TBAEvent with _$TBAEvent {
  factory TBAEvent({
    required String? address,
    required String? city,
    required String? country,
    required District? district,
    required List<String> divisionKeys,
    required DateTime? endDate,
    required String? eventCode,
    required int? eventType,
    required String? eventTypeString,
    required String? firstEventCode,
    required dynamic firstEventId,
    required String? gmapsPlaceId,
    required String? gmapsUrl,
    required String? key,
    required double? lat,
    required double? lng,
    required String? locationName,
    required String? name,
    required String? parentEventKey,
    required int? playoffType,
    required String? playoffTypeString,
    required String? postalCode,
    required String? shortName,
    required DateTime? startDate,
    required String? stateProv,
    required String? timezone,
    required List<Webcast> webcasts,
    required String? website,
    required int? week,
    required int? year,
  }) = _TBAEvent;

  factory TBAEvent.fromJson(Map<String, dynamic> json) =>
      _$TBAEventFromJson(json);
}

@freezed
class District with _$District {
  factory District({
    required String? abbreviation,
    required String? displayName,
    required String? key,
    required int? year,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Webcast with _$Webcast {
  factory Webcast({
    required String? channel,
    required String? type,
    required String? date,
  }) = _Webcast;

  factory Webcast.fromJson(Map<String, dynamic> json) =>
      _$WebcastFromJson(json);
}
