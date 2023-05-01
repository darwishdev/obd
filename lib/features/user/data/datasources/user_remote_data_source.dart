import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/login.dart';
import 'package:obd/features/user/domain/usecases/register.dart';
import 'package:obd/services/dio_client.dart';
import 'package:obd/utils/endpoints.dart';

abstract class UserRemoteDataSource {
  Future<UserInfoModel> login(LoginParams params);
  Future<UserInfoModel> authorize(NoParams params);
  Future<UserInfoModel> register(RegisterParams params);
}

final userRemoteDataSourceImpl = Provider<UserRemoteDataSourceImpl>(
  (ref) => UserRemoteDataSourceImpl(
    ref.watch(dioClientProvider),
  ),
);

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient;

  UserRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserInfoModel> login(LoginParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.login,
      data: {
        'email': params.emailOrPhone,
        'password': params.password,
      },
    );
    return UserInfoModel.fromJson(response.data);
  }

  @override
  Future<UserInfoModel> register(RegisterParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.register,
      data: {
        'name': params.name,
        'phone': params.phone,
        'email': params.email,
        'password': params.password,
        'car_brand_model': params.carBrandModel,
        'car_year': params.carYear,
      },
    );

    return UserInfoModel.fromJson(response.data);
  }

  @override
  Future<UserInfoModel> authorize(NoParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.userAuthorize,
      data: {},
    );
    return UserInfoModel.fromJson(response.data);
  }
}
