import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_subcategories_model.dart';
part 'pollution_sites_data_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PollutionSitesDataModel {
  @JsonKey(name: "closesetCityId")
  int? closesetCityId;

  @JsonKey(name: "subCategories")
  List<PollutionSubCategoriesModel>? subCategories;

  PollutionSitesDataModel();

  factory PollutionSitesDataModel.fromJson(Map<String, dynamic> json) => _$PollutionSitesDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$PollutionSitesDataModelToJson(this);
}
