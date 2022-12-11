import 'package:json_annotation/json_annotation.dart';

part 'directions_object.g.dart';

@JsonSerializable()
class DirectionsObject {
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "value")
  double? value;

  DirectionsObject();

  factory DirectionsObject.fromJson(Map<String, dynamic> json) =>
      _$DirectionsObjectFromJson(json);
  Map<String, dynamic> toJson() => _$DirectionsObjectToJson(this);
}
