// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
      sessionId: json['sessionId'] as int?,
      carId: json['carId'] as int?,
      emergencies: json['emergencies'] as int?,
      createdAt: json['createdAt'] as String?,
      finishedAt: json['finishedAt'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'carId': instance.carId,
      'emergencies': instance.emergencies,
      'createdAt': instance.createdAt,
      'finishedAt': instance.finishedAt,
    };
