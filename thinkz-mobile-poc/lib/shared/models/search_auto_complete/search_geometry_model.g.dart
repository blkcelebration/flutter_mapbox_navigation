// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_geometry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGeometryModel _$SearchGeometryModelFromJson(Map<String, dynamic> json) =>
    SearchGeometryModel()
      ..type = json['type'] as String?
      ..coordinates = (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$SearchGeometryModelToJson(
        SearchGeometryModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
