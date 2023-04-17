import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/cars/data/models/car_models_model.dart';

final selectedCarBrandProvider =
    StateProvider.autoDispose<List<CarModelsModel>?>((ref) => null);

final selectedCarModelProvider =
    StateProvider.autoDispose<CarModelsModel?>((ref) => null);

final selectedCarYearProvider = StateProvider.autoDispose<int?>((ref) => null);
