import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/datasources/cars_remote_data_source.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/domain/repositories/cars_repository.dart';

final carsRepositoryImpl =
    Provider<BanksRepositoryImpl>((ref) => BanksRepositoryImpl(
          ref.watch(carsRemoteDataSourceImpl),
        ));

class BanksRepositoryImpl implements CarsRepository {
  final CarsRemoteDataSource _carsRemoteDataSource;

  BanksRepositoryImpl(this._carsRemoteDataSource);

  @override
  Future<Either<Failure, List<CarBrandsModel>?>> getCars(
      NoParams params) async {
    try {
      final categoriesResponse = await _carsRemoteDataSource.getCars(params);
      return Right(categoriesResponse);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
