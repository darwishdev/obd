import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/data/repositories/center_repository_impl.dart';
import 'package:obd/features/centers/domain/repositories/center_repository.dart';

final centersUseCaseProvider = Provider.autoDispose<Centers>(
  (ref) => Centers(ref.watch(centerRepositoryImpl)),
);

class Centers implements UseCase<List<CenterModel>, CentersParams> {
  final CenterRepository _centerRepository;

  Centers(this._centerRepository);

  @override
  Future<Either<Failure, List<CenterModel>>> call(CentersParams params) async {
    return _centerRepository.centers(params);
  }
}

class CentersParams {
  final double? long;
  final double? lat;

  const CentersParams({
    this.lat,
    this.long,
  });
}
