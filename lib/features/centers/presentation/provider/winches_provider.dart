import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/domain/usecases/winches.dart';

final winchesProvider =
    StateNotifierProvider.autoDispose<WinchesProvider, ViewState>((ref) {
  return WinchesProvider(ref.watch(winchesUseCaseProvider));
});

class WinchesProvider extends BaseProvider<List<WinchModel>> {
  final Winches _winches;

  WinchesProvider(this._winches);

  Future<void> fetchWinches({double? lat, double? long}) async {
    setLoadingState();
    final response = await _winches.call(
      WinchesParams(
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
