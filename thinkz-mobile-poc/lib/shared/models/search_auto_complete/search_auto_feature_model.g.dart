// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_auto_feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAutoCompleteFeatureModel _$SearchAutoCompleteFeatureModelFromJson(
        Map<String, dynamic> json) =>
    SearchAutoCompleteFeatureModel()
      ..id = json['id'] as String?
      ..type = json['type'] as String?
      ..place_type = (json['place_type'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..relevance = (json['relevance'] as num?)?.toDouble()
      ..properties = json['properties']
      ..text = json['text'] as String?
      ..place_name = json['place_name'] as String?
      ..matching_text = json['matching_text'] as String?
      ..matching_place_name = json['matching_place_name'] as String?
      ..bbox = (json['bbox'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList()
      ..geometry = json['geometry'] == null
          ? null
          : SearchGeometryModel.fromJson(
              json['geometry'] as Map<String, dynamic>)
      ..context = (json['context'] as List<dynamic>?)
          ?.map((e) => SearchContextModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchAutoCompleteFeatureModelToJson(
        SearchAutoCompleteFeatureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'place_type': instance.place_type,
      'relevance': instance.relevance,
      'properties': instance.properties,
      'text': instance.text,
      'place_name': instance.place_name,
      'matching_text': instance.matching_text,
      'matching_place_name': instance.matching_place_name,
      'bbox': instance.bbox,
      'geometry': instance.geometry,
      'context': instance.context,
    };
