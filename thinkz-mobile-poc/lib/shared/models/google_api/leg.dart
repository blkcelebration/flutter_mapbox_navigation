import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_api/step.dart';
import 'package:thinkz/shared/models/google_api/location.dart';

import 'directions_object.dart';

part 'leg.g.dart';

@JsonSerializable()
class Leg {
  @JsonKey(name: "distance")
  DirectionsObject? distance;
  @JsonKey(name: "duration")
  DirectionsObject? duration;
  @JsonKey(name: "start_location")
  Location? startLocation;
  @JsonKey(name: "end_location")
  Location? endLocation;
  @JsonKey(name: "start_address")
  String? startAddress;
  @JsonKey(name: "end_address")
  String? endAddress;
  @JsonKey(name: "steps")
  List<Step>? steps;

  Leg();

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
  Map<String, dynamic> toJson() => _$LegToJson(this);
}
