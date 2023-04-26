// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionCodeModel _$SessionCodeModelFromJson(Map<String, dynamic> json) =>
    SessionCodeModel(
      codeId: json['codeId'] as int?,
      carBrandModelId: json['carBrandModelId'] as int?,
      codeName: json['codeName'] as String?,
      vehiclePart: json['VehiclePart'] as String?,
      codeType: json['CodeType'] as String?,
      description: json['description'] as String?,
      isEmergency: json['isEmergency'] as bool?,
    );

Map<String, dynamic> _$SessionCodeModelToJson(SessionCodeModel instance) =>
    <String, dynamic>{
      'codeId': instance.codeId,
      'carBrandModelId': instance.carBrandModelId,
      'codeName': instance.codeName,
      'VehiclePart': instance.vehiclePart,
      'CodeType': instance.codeType,
      'description': instance.description,
      'isEmergency': instance.isEmergency,
    };
