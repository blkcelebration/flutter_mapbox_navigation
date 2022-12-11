import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_auto_complete/geometry_model.dart';
part 'place_result_model.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PlaceResultModel {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "geometry")
  GeometryModel? geometry;

  PlaceResultModel();

  factory PlaceResultModel.fromJson(Map<String, dynamic> json) => _$PlaceResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceResultModelToJson(this);
}
