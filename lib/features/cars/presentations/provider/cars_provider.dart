import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/domain/usecases/cars.dart';

final carsProvider = StateNotifierProvider<CarsProvider, ViewState>(
    (ref) => CarsProvider(ref.watch(carsUseCaseProvider)));

class CarsProvider extends BaseProvider<List<CarBrandsModel>> {
  final Cars _cars;
  CarsProvider(this._cars);

  Future<void> fetchCars() async {
    setLoadingState();
    final response = await _cars.call(NoParams());
    response.fold((failure) {
      setErrorState(failure.message);
    }, (cars) {
      if (cars != null) {
        setLoadedState(cars);
      }
    });
  }
}
