// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutionSiteModel _$PollutionSiteModelFromJson(Map<String, dynamic> json) =>
    PollutionSiteModel()
      ..subCategoryId = json['subCategoryId'] as int?
      ..cityId = json['cityId'] as int?
      ..airQualityGrade = json['airQualityGrade'] as int?
      ..siteId = json['siteId'] as String?
      ..siteName = json['siteName'] as String?
      ..id = json['id'] as String?
      ..timestamp = json['timestamp'] as String?
      ..rank = json['rank'] as int?
      ..longitude = (json['longitude'] as num?)?.toDouble()
      ..latitude = (json['latitude'] as num?)?.toDouble();

Map<String, dynamic> _$PollutionSiteModelToJson(PollutionSiteModel instance) =>
    <String, dynamic>{
      'subCategoryId': instance.subCategoryId,
      'cityId': instance.cityId,
      'airQualityGrade': instance.airQualityGrade,
      'siteId': instance.siteId,
      'siteName': instance.siteName,
      'id': instance.id,
      'timestamp': instance.timestamp,
      'rank': instance.rank,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
