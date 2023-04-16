import 'package:json_annotation/json_annotation.dart';

part 'login_info_model.g.dart';

@JsonSerializable()
class LoginInfoModel {
  LoginInfoModel({
    this.accessToken,
    this.refreshToken,
    this.refreshTokenExpiresAt,
    this.accessTokenExpiresAt,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? refreshTokenExpiresAt;
  final String? accessTokenExpiresAt;

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoModelToJson(this);
}
