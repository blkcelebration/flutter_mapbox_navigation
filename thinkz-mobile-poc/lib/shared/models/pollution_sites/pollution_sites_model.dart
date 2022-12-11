import 'package:json_annotation/json_annotation.dart';

import 'pollution_sites_data_model.dart';
part 'pollution_sites_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class PollutionSitesModel {
  @JsonKey(name: "isSuccessful")
  bool? isSuccessful;

  @JsonKey(name: "statusCode")
  String? statusCode;

  @JsonKey(name: "statusMessage")
  String? statusMessage;

  @JsonKey(name: "displayMessage")
  String? displayMessage;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "exception")
  String? exception;

  @JsonKey(name: "data")
  PollutionSitesDataModel? data;

  PollutionSitesModel();

  factory PollutionSitesModel.fromJson(Map<String, dynamic> json) => _$PollutionSitesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PollutionSitesModelToJson(this);
}
