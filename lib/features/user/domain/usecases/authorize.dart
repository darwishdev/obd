import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/data/repositories/user_repository_impl.dart';
import 'package:obd/features/user/domain/repositories/user_repository.dart';

final authorizeUseCaseProvider = Provider<Authorize>(
  (ref) => Authorize(ref.watch(userRepositoryImpl)),
);

class Authorize implements UseCase<UserInfoModel, NoParams> {
  final UserRepository _userRepository;

  Authorize(this._userRepository);

  @override
  Future<Either<Failure, UserInfoModel>> call(NoParams params) async {
    return _userRepository.authorize(params);
  }
}
