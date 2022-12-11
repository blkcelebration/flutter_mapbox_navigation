// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResultModel _$PlaceResultModelFromJson(Map<String, dynamic> json) =>
    PlaceResultModel()
      ..name = json['name'] as String?
      ..geometry = json['geometry'] == null
          ? null
          : GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceResultModelToJson(PlaceResultModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'geometry': instance.geometry,
    };
