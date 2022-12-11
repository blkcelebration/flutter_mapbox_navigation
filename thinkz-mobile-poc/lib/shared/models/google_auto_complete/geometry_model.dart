import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_api/location.dart';
part 'geometry_model.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GeometryModel {

  @JsonKey(name: "location")
  Location? location;

  GeometryModel();

  factory GeometryModel.fromJson(Map<String, dynamic> json) => _$GeometryModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}
