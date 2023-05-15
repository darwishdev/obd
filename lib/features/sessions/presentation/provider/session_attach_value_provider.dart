import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/home/data/models/obd_model.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_value.dart';
import 'package:obd/features/sessions/presentation/provider/session_create_provider.dart';

final sessionAttachValueProvider =
    StateNotifierProvider.autoDispose<SessionAttachValueProvider, ViewState>(
        (ref) {
  return SessionAttachValueProvider(
    ref.watch(sessionAttachValueUseCaseProvider),
    ref,
  );
});

class SessionAttachValueProvider extends BaseProvider<bool> {
  final SessionAttachValue _sessionAttachValue;
  final Ref _ref;

  SessionAttachValueProvider(this._sessionAttachValue, this._ref);

  Future<void> sessionAttachValue(OBDModel obdInfo) async {
    setLoadingState();
    final response = await _sessionAttachValue.call(
      SessionAttachValueParams(
        sessionId: _ref.read(sessionCreateProvider.notifier).sessionID,
        obdInfo: obdInfo,
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
