import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_api/leg.dart';
import 'package:thinkz/shared/models/google_api/overview_polyline.dart';
part 'route.g.dart';

@JsonSerializable()
class Route {
  @JsonKey(name: "legs")
  List<Leg>? legs;

  @JsonKey(name: "overview_polyline")
  OverviewPolyline? overviewPolyline;

  Route();

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
