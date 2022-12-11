// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlaceModel _$GooglePlaceModelFromJson(Map<String, dynamic> json) =>
    GooglePlaceModel()
      ..result = json['result'] == null
          ? null
          : PlaceResultModel.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$GooglePlaceModelToJson(GooglePlaceModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
