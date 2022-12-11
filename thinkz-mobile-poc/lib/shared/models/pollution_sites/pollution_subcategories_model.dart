import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_site_model.dart';
part 'pollution_subcategories_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PollutionSubCategoriesModel {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "sites")
  List<PollutionSiteModel>? sites;

  PollutionSubCategoriesModel();

  factory PollutionSubCategoriesModel.fromJson(Map<String, dynamic> json) => _$PollutionSubCategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PollutionSubCategoriesModelToJson(this);
}
