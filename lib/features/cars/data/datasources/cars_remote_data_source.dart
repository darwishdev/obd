import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';
import 'package:obd/services/dio_client.dart';
import 'package:obd/utils/endpoints.dart';

abstract class CarsRemoteDataSource {
  Future<List<CarBrandsModel>?> getCars(NoParams params);
  Future<bool> updateCar(UpdateCarParams params);
}

final carsRemoteDataSourceImpl = Provider<CarsRemoteDataSourceImpl>(
    (ref) => CarsRemoteDataSourceImpl(ref.watch(dioClientProvider)));

class CarsRemoteDataSourceImpl implements CarsRemoteDataSource {
  final DioClient _dioClient;

  CarsRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<CarBrandsModel>?> getCars(NoParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.carBrands,
      data: {},
    );
    final cars = <CarBrandsModel>[];
    for (final bank in response.data['brands']) {
      cars.add(CarBrandsModel.fromJson(bank));
    }
    return cars;
  }

  @override
  Future<bool> updateCar(UpdateCarParams params) async {
    await _dioClient.dio.post(
      EndPoints.carUpdate,
      data: {
        'car_brand_model_id': params.carBrandModelId,
        'model_year': params.carYear,
      },
    );
    return true;
  }
}
