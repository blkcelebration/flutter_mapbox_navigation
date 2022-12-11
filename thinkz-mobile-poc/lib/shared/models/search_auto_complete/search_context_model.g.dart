// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchContextModel _$SearchContextModelFromJson(Map<String, dynamic> json) =>
    SearchContextModel()
      ..id = json['id'] as String?
      ..short_code = json['short_code'] as String?
      ..wikidata = json['wikidata'] as String?
      ..text = json['text'] as String?;

Map<String, dynamic> _$SearchContextModelToJson(SearchContextModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'short_code': instance.short_code,
      'wikidata': instance.wikidata,
      'text': instance.text,
    };
