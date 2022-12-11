import 'package:json_annotation/json_annotation.dart';
part 'pollution_site_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PollutionSiteModel {
  @JsonKey(name: "subCategoryId")
  int? subCategoryId;

  @JsonKey(name: "cityId")
  int? cityId;

  @JsonKey(name: "airQualityGrade")
  int? airQualityGrade;

  @JsonKey(name: "siteId")
  String? siteId;

  @JsonKey(name: "siteName")
  String? siteName;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "timestamp")
  String? timestamp;

  @JsonKey(name: "rank")
  int? rank;

  @JsonKey(name: "longitude")
  double? longitude;

  @JsonKey(name: "latitude")
  double? latitude;

  PollutionSiteModel();

  factory PollutionSiteModel.fromJson(Map<String, dynamic> json) => _$PollutionSiteModelFromJson(json);
  Map<String, dynamic> toJson() => _$PollutionSiteModelToJson(this);
}
