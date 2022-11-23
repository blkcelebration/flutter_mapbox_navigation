import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_api/directions_object.dart';
import 'package:thinkz/shared/models/google_api/location.dart';

part 'step.g.dart';

@JsonSerializable()
class Step {
  @JsonKey(name: "distance")
  DirectionsObject? distance;
  @JsonKey(name: "duration")
  DirectionsObject? duration;
  @JsonKey(name: "start_location")
  Location? startLocation;
  @JsonKey(name: "end_location")
  Location? endLocation;

  Step();

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
  Map<String, dynamic> toJson() => _$StepToJson(this);
}
