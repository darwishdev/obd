// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CenterModel _$CenterModelFromJson(Map<String, dynamic> json) => CenterModel(
      centerId: json['centerId'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      areaId: json['areaId'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CenterModelToJson(CenterModel instance) =>
    <String, dynamic>{
      'centerId': instance.centerId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'areaId': instance.areaId,
      'lat': instance.lat,
      'long': instance.long,
      'distance': instance.distance,
      'createdAt': instance.createdAt,
    };
