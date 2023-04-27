import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/user/data/models/user_info_model.dart';
import 'package:obd/features/user/domain/usecases/authorize.dart';

final authorizeProvider =
    StateNotifierProvider<AuthorizeProvider, ViewState>((ref) {
  return AuthorizeProvider(ref.watch(authorizeUseCaseProvider));
});

class AuthorizeProvider extends BaseProvider<UserInfoModel> {
  final Authorize _authorize;
  AuthorizeProvider(this._authorize);

  Future<void> authorize() async {
    setLoadingState();
    final response = await _authorize.call(NoParams());
    response.fold(
      (failure) => setErrorState(failure.message),
      setLoadedState,
    );
  }
}
