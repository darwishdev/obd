import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/sessions/domain/usecases/session_create.dart';

final sessionCreateProvider =
    StateNotifierProvider<SessionCreateProvider, ViewState>((ref) {
  return SessionCreateProvider(ref.watch(sessionCreateUseCaseProvider));
});

class SessionCreateProvider extends BaseProvider<int> {
  final SessionCreate _sessionCreate;
  late bool isLive;
  SessionCreateProvider(this._sessionCreate);

  Future<void> fetchSessionCreate(bool isLive) async {
    this.isLive = isLive;
    setLoadingState();
    final response = await _sessionCreate.call(SessionCreateParams(isLive));
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }

  int get sessionID => (state as LoadedViewState<int>).data;
}
