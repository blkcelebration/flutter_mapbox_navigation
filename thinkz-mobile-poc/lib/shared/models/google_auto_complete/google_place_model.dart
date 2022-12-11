import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_auto_complete/place_result_model.dart';
part 'google_place_model.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GooglePlaceModel {
  @JsonKey(name: "result")
  PlaceResultModel? result;

  GooglePlaceModel();

  factory GooglePlaceModel.fromJson(Map<String, dynamic> json) => _$GooglePlaceModelFromJson(json);
  Map<String, dynamic> toJson() => _$GooglePlaceModelToJson(this);
}