import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/data/repositories/user_repository_impl.dart';
import 'package:obd/features/user/domain/repositories/user_repository.dart';

final loginProvider = Provider<Login>(
  (ref) => Login(ref.watch(userRepositoryImpl)),
);

class Login implements UseCase<UserInfoModel, LoginParams> {
  final UserRepository _userRepository;

  Login(this._userRepository);

  @override
  Future<Either<Failure, UserInfoModel>> call(LoginParams params) async {
    return _userRepository.login(params);
  }
}

class LoginParams {
  final String emailOrPhone;
  final String password;

  const LoginParams({
    required this.emailOrPhone,
    required this.password,
  });
}
