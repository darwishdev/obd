import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/cars/domain/usecases/update_cars.dart';

final updateCarProvider =
    StateNotifierProvider.autoDispose<UpdateCarProvider, ViewState>((ref) {
  return UpdateCarProvider(ref.watch(updateCarUseCaseProvider));
});

class UpdateCarProvider extends BaseProvider<bool> {
  final UpdateCar _updateCar;
  UpdateCarProvider(this._updateCar);

  Future<void> updateCar(UpdateCarParams params) async {
    setLoadingState();
    final response = await _updateCar.call(params);
    response.fold(
      (failure) => setErrorState(failure.message),
      setLoadedState,
    );
  }
}
