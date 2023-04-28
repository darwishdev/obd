import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/data/repositories/center_repository_impl.dart';
import 'package:obd/features/centers/domain/repositories/center_repository.dart';

final winchesUseCaseProvider = Provider.autoDispose<Winches>(
  (ref) => Winches(ref.watch(centerRepositoryImpl)),
);

class Winches implements UseCase<List<WinchModel>, WinchesParams> {
  final CenterRepository _centerRepository;

  Winches(this._centerRepository);

  @override
  Future<Either<Failure, List<WinchModel>>> call(WinchesParams params) async {
    return _centerRepository.winches(params);
  }
}

class WinchesParams {
  final double? long;
  final double? lat;

  const WinchesParams({
    this.lat,
    this.long,
  });
}
