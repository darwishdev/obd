// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarBrandsModel _$CarBrandsModelFromJson(Map<String, dynamic> json) =>
    CarBrandsModel(
      carBrandId: json['carBrandId'] as int?,
      name: json['name'] as String?,
      models: (json['models'] as List<dynamic>?)
          ?.map((e) => CarModelsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarBrandsModelToJson(CarBrandsModel instance) =>
    <String, dynamic>{
      'carBrandId': instance.carBrandId,
      'name': instance.name,
      'models': instance.models,
    };
