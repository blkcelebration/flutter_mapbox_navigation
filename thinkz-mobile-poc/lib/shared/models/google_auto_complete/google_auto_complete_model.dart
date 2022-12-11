import 'package:json_annotation/json_annotation.dart';
import 'package:thinkz/shared/models/google_auto_complete/auto_complete_predictions_model.dart';
import 'package:thinkz/shared/models/google_auto_complete/place_result_model.dart';
part 'google_auto_complete_model.g.dart';
// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GoogleAutoCompleteModel {
  @JsonKey(name: "predictions")
  List<AutoCompletePredictionsModel>? predictions;

  GoogleAutoCompleteModel();

  factory GoogleAutoCompleteModel.fromJson(Map<String, dynamic> json) => _$GoogleAutoCompleteModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleAutoCompleteModelToJson(this);
}
