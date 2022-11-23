// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_directions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDirectionsResponse _$GetDirectionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetDirectionsResponse()
      ..routes = (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDirectionsResponseToJson(
        GetDirectionsResponse instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };
