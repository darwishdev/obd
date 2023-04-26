import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/domain/usecases/session_code.dart';

final sessionCodesProvider =
    StateNotifierProvider.autoDispose<SessionCodesProvider, ViewState>((ref) {
  return SessionCodesProvider(ref.watch(sessionCodeUseCaseProvider));
});

class SessionCodesProvider extends BaseProvider<List<SessionCodeModel>> {
  final SessionCode _sessionCode;

  SessionCodesProvider(this._sessionCode);

  Future<void> fetchSessionCodes({int? sessionId}) async {
    setLoadingState();
    final response = await _sessionCode.call(
      SessionCodeParams(sessionId: sessionId),
    );
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }
}
