import 'package:json_annotation/json_annotation.dart';
import 'package:obd/features/user/data/models/car_model.dart';
import 'package:obd/features/user/data/models/login_info_model.dart';
import 'package:obd/features/user/data/models/user_model.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  UserInfoModel({
    this.user,
    this.car,
    this.loginInfo,
  });

  final UserModel? user;
  final CarModel? car;
  final LoginInfoModel? loginInfo;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
