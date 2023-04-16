import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/login.dart';
import 'package:obd/features/user/domain/usecases/register.dart';

abstract class UserRepository {
  Future<Either<Failure, UserInfoModel>> login(LoginParams params);
  Future<Either<Failure, UserInfoModel>> register(RegisterParams params);
}
