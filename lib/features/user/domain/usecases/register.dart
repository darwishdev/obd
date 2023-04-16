import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/data/repositories/user_repository_impl.dart';
import 'package:obd/features/user/domain/repositories/user_repository.dart';

final registerProvider = Provider<Register>(
  (ref) => Register(ref.watch(userRepositoryImpl)),
);

class Register implements UseCase<UserInfoModel, RegisterParams> {
  final UserRepository _userRepository;

  Register(this._userRepository);

  @override
  Future<Either<Failure, UserInfoModel>> call(RegisterParams params) async {
    return _userRepository.register(params);
  }
}

class RegisterParams {
  final String name;
  final String phone;
  final String email;
  final String password;
  final int carBrandModel;
  final int carYear;

  const RegisterParams({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.carBrandModel,
    required this.carYear,
  });
}
