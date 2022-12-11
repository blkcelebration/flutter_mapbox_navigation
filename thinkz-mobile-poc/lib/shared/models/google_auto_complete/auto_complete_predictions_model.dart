import 'package:json_annotation/json_annotation.dart';
part 'auto_complete_predictions_model.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class AutoCompletePredictionsModel {
  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "place_id")
  String? place_id;

  AutoCompletePredictionsModel();

  factory AutoCompletePredictionsModel.fromJson(Map<String, dynamic> json) => _$AutoCompletePredictionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AutoCompletePredictionsModelToJson(this);
}
