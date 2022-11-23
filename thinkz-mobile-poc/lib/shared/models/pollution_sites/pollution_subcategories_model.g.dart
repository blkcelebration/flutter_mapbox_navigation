// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_subcategories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutionSubCategoriesModel _$PollutionSubCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    PollutionSubCategoriesModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..sites = (json['sites'] as List<dynamic>?)
          ?.map((e) => PollutionSiteModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PollutionSubCategoriesModelToJson(
        PollutionSubCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sites': instance.sites,
    };
