import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/register.dart';

final userRegisterProvider =
    StateNotifierProvider.autoDispose<UserRegisterProvider, ViewState>((ref) {
  return UserRegisterProvider(
    ref.watch(registerProvider),
  );
});

class UserRegisterProvider extends BaseProvider<UserInfoModel> {
  final Register _register;
  UserRegisterProvider(this._register);

  Future<void> register(RegisterParams params) async {
    setLoadingState();
    final response = await _register.call(params);
    response.fold(
      (failure) => setErrorState(failure.message),
      setLoadedState,
    );
  }
}
