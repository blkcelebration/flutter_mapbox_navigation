// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_sites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutionSitesModel _$PollutionSitesModelFromJson(Map<String, dynamic> json) =>
    PollutionSitesModel()
      ..isSuccessful = json['isSuccessful'] as bool?
      ..statusCode = json['statusCode'] as String?
      ..statusMessage = json['statusMessage'] as String?
      ..displayMessage = json['displayMessage'] as String?
      ..description = json['description'] as String?
      ..exception = json['exception'] as String?
      ..data = json['data'] == null
          ? null
          : PollutionSitesDataModel.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$PollutionSitesModelToJson(
        PollutionSitesModel instance) =>
    <String, dynamic>{
      'isSuccessful': instance.isSuccessful,
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'displayMessage': instance.displayMessage,
      'description': instance.description,
      'exception': instance.exception,
      'data': instance.data,
    };
