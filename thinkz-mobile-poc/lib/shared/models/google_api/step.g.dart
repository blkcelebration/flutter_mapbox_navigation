// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) => Step()
  ..distance = json['distance'] == null
      ? null
      : DirectionsObject.fromJson(json['distance'] as Map<String, dynamic>)
  ..duration = json['duration'] == null
      ? null
      : DirectionsObject.fromJson(json['duration'] as Map<String, dynamic>)
  ..startLocation = json['start_location'] == null
      ? null
      : Location.fromJson(json['start_location'] as Map<String, dynamic>)
  ..endLocation = json['end_location'] == null
      ? null
      : Location.fromJson(json['end_location'] as Map<String, dynamic>);

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'start_location': instance.startLocation,
      'end_location': instance.endLocation,
    };
