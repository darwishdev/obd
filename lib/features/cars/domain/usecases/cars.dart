import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/data/repositories/cars_repository_impl.dart';
import 'package:obd/features/cars/domain/repositories/cars_repository.dart';

final carsUseCaseProvider =
    Provider<Cars>((ref) => Cars(ref.watch(carsRepositoryImpl)));

class Cars implements UseCase<List<CarBrandsModel>?, NoParams> {
  final CarsRepository _CarsRepository;

  Cars(this._CarsRepository);

  @override
  Future<Either<Failure, List<CarBrandsModel>?>> call(NoParams params) async {
    return _CarsRepository.getCars(params);
  }
}
