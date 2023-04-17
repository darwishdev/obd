import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';

abstract class CarsRepository {
  Future<Either<Failure, List<CarBrandsModel>?>> getCars(NoParams params);
  Future<Either<Failure, bool>> updateCar(UpdateCarParams params);
}
