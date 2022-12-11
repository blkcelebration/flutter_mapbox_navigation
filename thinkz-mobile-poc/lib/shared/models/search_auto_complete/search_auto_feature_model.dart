// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_context_model.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_geometry_model.dart';
part 'search_auto_feature_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class SearchAutoCompleteFeatureModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "place_type")
  List<String>? place_type;

  @JsonKey(name: "relevance")
  double? relevance;

  @JsonKey(name: "properties")
  dynamic properties;

  @JsonKey(name: "text")
  String? text;

  @JsonKey(name: "place_name")
  String? place_name;

  @JsonKey(name: "matching_text")
  String? matching_text;

  @JsonKey(name: "matching_place_name")
  String? matching_place_name;

  @JsonKey(name: "bbox")
  List<double>? bbox;

  @JsonKey(name: "geometry")
  SearchGeometryModel? geometry;

  @JsonKey(name: "context")
  List<SearchContextModel>? context;

  SearchAutoCompleteFeatureModel();

  factory SearchAutoCompleteFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$SearchAutoCompleteFeatureModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchAutoCompleteFeatureModelToJson(this);
}
