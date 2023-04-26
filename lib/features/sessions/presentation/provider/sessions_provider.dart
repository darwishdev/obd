import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/domain/usecases/sessions.dart';

final sessionsProvider =
    StateNotifierProvider.autoDispose<SessionsProvider, ViewState>((ref) {
  return SessionsProvider(ref.watch(sessionsUseCaseProvider));
});

class SessionsProvider extends BaseProvider<List<SessionModel>> {
  final Sessions _sessions;

  SessionsProvider(this._sessions);

  Future<void> fetchSessions() async {
    setLoadingState();
    final response = await _sessions.call(NoParams());
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }
}
