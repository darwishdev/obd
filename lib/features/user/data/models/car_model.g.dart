// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      carId: json['carId'] as int?,
      carBrandId: json['carBrandId'] as int?,
      carBrandModelId: json['carBrandModelId'] as int?,
      brandName: json['brandName'] as String?,
      brandModelName: json['brandModelName'] as String?,
      modelYear: json['modelYear'] as int?,
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'carId': instance.carId,
      'carBrandId': instance.carBrandId,
      'carBrandModelId': instance.carBrandModelId,
      'brandName': instance.brandName,
      'brandModelName': instance.brandModelName,
      'modelYear': instance.modelYear,
    };
