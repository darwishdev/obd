import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/user/data/datasources/user_local_data_source.dart';
import 'package:obd/features/user/data/datasources/user_remote_data_source.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/repositories/user_repository.dart';
import 'package:obd/features/user/domain/usecases/login.dart';
import 'package:obd/features/user/domain/usecases/register.dart';

final userRepositoryImpl =
    Provider<UserRepositoryImpl>((ref) => UserRepositoryImpl(
          ref.watch(userRemoteDataSourceImpl),
          ref.watch(userLocalDataSourceImpl),
        ));

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    this._userRemoteDataSource,
    this._userLocalDataSource,
  );
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  @override
  Future<Either<Failure, UserInfoModel>> login(LoginParams params) async {
    try {
      final response = await _userRemoteDataSource.login(params);
      print('response: $response');
      _userLocalDataSource.cashUserData(response);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> register(RegisterParams params) async {
    try {
      final response = await _userRemoteDataSource.register(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
