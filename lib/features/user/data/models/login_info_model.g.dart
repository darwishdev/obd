// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfoModel _$LoginInfoModelFromJson(Map<String, dynamic> json) =>
    LoginInfoModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiresAt: json['refreshTokenExpiresAt'] as String?,
      accessTokenExpiresAt: json['accessTokenExpiresAt'] as String?,
    );

Map<String, dynamic> _$LoginInfoModelToJson(LoginInfoModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt,
    };
