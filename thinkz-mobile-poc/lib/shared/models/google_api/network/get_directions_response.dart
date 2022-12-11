import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_api/route.dart';

part 'get_directions_response.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build

@JsonSerializable()
class GetDirectionsResponse {
  @JsonKey(name: "routes")
  List<Route>? routes;

  GetDirectionsResponse();

  factory GetDirectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDirectionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetDirectionsResponseToJson(this);
}
