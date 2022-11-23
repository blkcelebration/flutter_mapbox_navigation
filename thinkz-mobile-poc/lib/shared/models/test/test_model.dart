import 'package:json_annotation/json_annotation.dart';
part 'test_model.g.dart';

// To generate file run this line to update json_serliziable:
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class TestModel {
  @JsonKey(name: "userId")
  int? userId;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "body")
  String? body;

  TestModel();

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
