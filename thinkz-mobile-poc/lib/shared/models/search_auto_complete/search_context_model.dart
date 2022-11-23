// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'search_context_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class SearchContextModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "short_code")
  String? short_code;

  @JsonKey(name: "wikidata")
  String? wikidata;

  @JsonKey(name: "text")
  String? text;

  SearchContextModel();

  factory SearchContextModel.fromJson(Map<String, dynamic> json) => _$SearchContextModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchContextModelToJson(this);
}
