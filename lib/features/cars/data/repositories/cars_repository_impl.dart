import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/datasources/cars_remote_data_source.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/domain/repositories/cars_repository.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';

final carsRepositoryImpl =
    Provider<CarsRepositoryImpl>((ref) => CarsRepositoryImpl(
          ref.watch(carsRemoteDataSourceImpl),
        ));

class CarsRepositoryImpl implements CarsRepository {
  final CarsRemoteDataSource _carsRemoteDataSource;

  CarsRepositoryImpl(this._carsRemoteDataSource);

  @override
  Future<Either<Failure, List<CarBrandsModel>?>> getCars(
      NoParams params) async {
    try {
      final response = await _carsRemoteDataSource.getCars(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCar(UpdateCarParams params) async {
    try {
      final response = await _carsRemoteDataSource.updateCar(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
