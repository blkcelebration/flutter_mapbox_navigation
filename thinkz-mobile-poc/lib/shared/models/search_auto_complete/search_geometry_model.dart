import 'package:json_annotation/json_annotation.dart';
part 'search_geometry_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class SearchGeometryModel {
  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "coordinates")
  List<double>? coordinates;

  SearchGeometryModel();

  factory SearchGeometryModel.fromJson(Map<String, dynamic> json) => _$SearchGeometryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchGeometryModelToJson(this);
}
