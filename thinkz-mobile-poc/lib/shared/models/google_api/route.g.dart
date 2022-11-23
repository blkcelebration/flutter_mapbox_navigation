// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Route _$RouteFromJson(Map<String, dynamic> json) => Route()
  ..legs = (json['legs'] as List<dynamic>?)
      ?.map((e) => Leg.fromJson(e as Map<String, dynamic>))
      .toList()
  ..overviewPolyline = json['overview_polyline'] == null
      ? null
      : OverviewPolyline.fromJson(
          json['overview_polyline'] as Map<String, dynamic>);

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'legs': instance.legs,
      'overview_polyline': instance.overviewPolyline,
    };
