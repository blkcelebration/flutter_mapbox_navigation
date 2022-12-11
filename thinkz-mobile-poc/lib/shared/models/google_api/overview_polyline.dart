import 'package:json_annotation/json_annotation.dart';
part 'overview_polyline.g.dart';

@JsonSerializable()
class OverviewPolyline {
  @JsonKey(name: "points")
  dynamic points;

  OverviewPolyline();

  factory OverviewPolyline.fromJson(Map<String, dynamic> json) =>
      _$OverviewPolylineFromJson(json);
  Map<String, dynamic> toJson() => _$OverviewPolylineToJson(this);
}
