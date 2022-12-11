// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_sites_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutionSitesDataModel _$PollutionSitesDataModelFromJson(
        Map<String, dynamic> json) =>
    PollutionSitesDataModel()
      ..closesetCityId = json['closesetCityId'] as int?
      ..subCategories = (json['subCategories'] as List<dynamic>?)
          ?.map((e) =>
              PollutionSubCategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PollutionSitesDataModelToJson(
        PollutionSitesDataModel instance) =>
    <String, dynamic>{
      'closesetCityId': instance.closesetCityId,
      'subCategories': instance.subCategories,
    };
