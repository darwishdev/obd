import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    this.userID,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.createdAt,
    this.deletedAt,
  });

  @JsonKey(name: 'user_id')
  final int? userID;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? createdAt;
  final String? deletedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
