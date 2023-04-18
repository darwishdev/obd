import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/repositories/cars_repository_impl.dart';
import 'package:obd/features/cars/domain/repositories/cars_repository.dart';

final updateCarUseCaseProvider = Provider<UpdateCar>(
  (ref) => UpdateCar(ref.watch(carsRepositoryImpl)),
);

class UpdateCar implements UseCase<bool, UpdateCarParams> {
  final CarsRepository _carsRepository;

  UpdateCar(this._carsRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateCarParams params) async {
    return _carsRepository.updateCar(params);
  }
}

class UpdateCarParams {
  final int carBrandModelId;
  final int carYear;

  const UpdateCarParams({
    required this.carBrandModelId,
    required this.carYear,
  });
}
