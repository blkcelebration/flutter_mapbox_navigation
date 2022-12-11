// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_auto_complete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAutoCompleteModel _$SearchAutoCompleteModelFromJson(
        Map<String, dynamic> json) =>
    SearchAutoCompleteModel()
      ..type = json['type'] as String?
      ..query =
          (json['query'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..title = json['title'] as String?
      ..features = (json['features'] as List<dynamic>?)
          ?.map((e) => SearchAutoCompleteFeatureModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..attribution = json['attribution'] as String?;

Map<String, dynamic> _$SearchAutoCompleteModelToJson(
        SearchAutoCompleteModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'title': instance.title,
      'features': instance.features,
      'attribution': instance.attribution,
    };
