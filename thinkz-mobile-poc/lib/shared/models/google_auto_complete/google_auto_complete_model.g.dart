// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_auto_complete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleAutoCompleteModel _$GoogleAutoCompleteModelFromJson(
        Map<String, dynamic> json) =>
    GoogleAutoCompleteModel()
      ..predictions = (json['predictions'] as List<dynamic>?)
          ?.map((e) =>
              AutoCompletePredictionsModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GoogleAutoCompleteModelToJson(
        GoogleAutoCompleteModel instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };
