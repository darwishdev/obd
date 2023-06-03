// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obd_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OBDModel _$OBDModelFromJson(Map<String, dynamic> json) => OBDModel(
      speed: json['speed'] as String?,
      rpm: json['rpm'] as String?,
      airIntakeTemp: json['airIntakeTemp'] as String?,
      engineLoad: json['engineLoad'] as String?,
      moduleVoltage: json['moduleVoltage'] as String?,
      oilTemp: json['oilTemp'] as String?,
      airFuelRatio: json['airFuelRatio'] as String?,
      fuelPressure: json['fuelPressure'] as String?,
    );

Map<String, dynamic> _$OBDModelToJson(OBDModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'rpm': instance.rpm,
      'airIntakeTemp': instance.airIntakeTemp,
      'engineLoad': instance.engineLoad,
      'moduleVoltage': instance.moduleVoltage,
      'oilTemp': instance.oilTemp,
      'airFuelRatio': instance.airFuelRatio,
      'fuelPressure': instance.fuelPressure,
    };
