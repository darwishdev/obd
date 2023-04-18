import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/cars/data/models/car_brands_model.dart';
import 'package:obd/features/cars/data/models/car_models_model.dart';

final selectedCarBrandProvider =
    StateProvider.autoDispose<CarBrandsModel?>((ref) => null);

final selectedCarModelProvider =
    StateProvider.autoDispose<CarModelsModel?>((ref) => null);

final selectedCarYearProvider = StateProvider.autoDispose<int?>((ref) => null);
