// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarModel.fromJson(json['car'] as Map<String, dynamic>),
      loginInfo: json['loginInfo'] == null
          ? null
          : LoginInfoModel.fromJson(json['loginInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'car': instance.car,
      'loginInfo': instance.loginInfo,
    };
