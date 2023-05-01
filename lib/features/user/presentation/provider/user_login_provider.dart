import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/login.dart';

final userLoginProvider =
    StateNotifierProvider.autoDispose<UserLoginProvider, ViewState>((ref) {
  return UserLoginProvider(
    ref.watch(loginProvider),
    ref.watch(tokenRepositoryProvider),
  );
});

class UserLoginProvider extends BaseProvider<UserInfoModel> {
  final Login _login;
  final TokenRepository _tokenRepository;

  UserLoginProvider(this._login, this._tokenRepository);

  Future<void> login({
    required String emailOrPhone,
    required String password,
  }) async {
    setLoadingState();
    final response = await _login.call(LoginParams(
      emailOrPhone: emailOrPhone,
      password: password,
    ));
    response.fold(
      (failure) => setErrorState(failure.message),
      setLoadedState,
    );
  }

  Future<void> logout() async {
    await _tokenRepository.deleteUserAccess();
  }
}
