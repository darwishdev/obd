import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/domain/usecases/centers.dart';

final centersProvider =
    StateNotifierProvider.autoDispose<CentersProvider, ViewState>((ref) {
  return CentersProvider(ref.watch(centersUseCaseProvider));
});

class CentersProvider extends BaseProvider<List<CenterModel>> {
  final Centers _centers;

  CentersProvider(this._centers);

  Future<void> fetchCenters({double? lat, double? long}) async {
    setLoadingState();
    final response = await _centers.call(
      CentersParams(
        lat: lat,
        long: long,
      ),
    );
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }
}
