// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_models_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModelsModel _$CarModelsModelFromJson(Map<String, dynamic> json) =>
    CarModelsModel(
      carBrandModelId: json['carBrandModelId'] as String?,
      name: json['name'] as String?,
      years: json['years'] as String?,
    );

Map<String, dynamic> _$CarModelsModelToJson(CarModelsModel instance) =>
    <String, dynamic>{
      'carBrandModelId': instance.carBrandModelId,
      'name': instance.name,
      'years': instance.years,
    };
