// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directions_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectionsObject _$DirectionsObjectFromJson(Map<String, dynamic> json) =>
    DirectionsObject()
      ..text = json['text'] as String?
      ..value = (json['value'] as num?)?.toDouble();

Map<String, dynamic> _$DirectionsObjectToJson(DirectionsObject instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
