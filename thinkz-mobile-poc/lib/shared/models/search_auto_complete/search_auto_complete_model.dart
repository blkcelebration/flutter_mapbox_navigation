import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_auto_feature_model.dart';
part 'search_auto_complete_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class SearchAutoCompleteModel {
  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "query")
  List<String>? query;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "features")
  List<SearchAutoCompleteFeatureModel>? features;

  @JsonKey(name: "attribution")
  String? attribution;

  SearchAutoCompleteModel();

  factory SearchAutoCompleteModel.fromJson(Map<String, dynamic> json) => _$SearchAutoCompleteModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchAutoCompleteModelToJson(this);
}
