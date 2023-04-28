// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinchModel _$WinchModelFromJson(Map<String, dynamic> json) => WinchModel(
      winchID: json['WinchID'] as int?,
      name: json['Name'] as String?,
      phone: json['Phone'] as String?,
      driverName: json['DriverName'] as String?,
      driverPhone: json['DriverPhone'] as String?,
      lat: (json['Lat'] as num?)?.toDouble(),
      long: (json['Long'] as num?)?.toDouble(),
      createdAt: json['CreatedAt'] as String?,
      distance: (json['Distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WinchModelToJson(WinchModel instance) =>
    <String, dynamic>{
      'WinchID': instance.winchID,
      'Name': instance.name,
      'Phone': instance.phone,
      'DriverName': instance.driverName,
      'DriverPhone': instance.driverPhone,
      'Lat': instance.lat,
      'Long': instance.long,
      'CreatedAt': instance.createdAt,
      'Distance': instance.distance,
    };
