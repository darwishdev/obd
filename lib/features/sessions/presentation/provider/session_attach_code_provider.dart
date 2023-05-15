import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_code.dart';
import 'package:obd/features/sessions/presentation/provider/session_create_provider.dart';

final sessionAttachCodeProvider =
    StateNotifierProvider<SessionAttachCodeProvider, ViewState>((ref) {
  return SessionAttachCodeProvider(
    ref.watch(sessionAttachCodeUseCaseProvider),
    ref,
  );
});

class SessionAttachCodeProvider extends BaseProvider<bool> {
  final SessionAttachCode _sessionAttachCode;
  final Ref _ref;

  SessionAttachCodeProvider(
    this._sessionAttachCode,
    this._ref,
  );

  Future<void> sessionAttachCode(List<String> codeIDs) async {
    setLoadingState();
    final response = await _sessionAttachCode.call(
      SessionAttachCodeParams(
        sessionId: _ref.read(sessionCreateProvider.notifier).sessionID,
        codeIDs: codeIDs.join(','),
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
