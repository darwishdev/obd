import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/domain/usecases/session_code.dart';
import 'package:obd/services/shared_prefs.dart';
import 'package:obd/utils/storage_keys_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sessionCodesProvider =
    StateNotifierProvider.autoDispose<SessionCodesProvider, ViewState>((ref) {
  return SessionCodesProvider(
    ref.watch(sessionCodeUseCaseProvider),
    ref.watch(sharedPrefsProvider),
  );
});

class SessionCodesProvider extends BaseProvider<List<SessionCodeModel>> {
  final SessionCode _sessionCode;
  final SharedPreferences _preferences;

  SessionCodesProvider(this._sessionCode, this._preferences);

  Future<void> fetchSessionCodes(int? sessionId) async {
    setLoadingState();
    final response = await _sessionCode.call(
      SessionCodeParams(sessionId: sessionId),
    );
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      (data) {
        _saveEmergencies(data);
        setLoadedState(data);
      },
    );
  }

  void _saveEmergencies(List<SessionCodeModel> data) {
    final emergencies = data.where((e) => e.isEmergency == false).toList();
    _preferences.setString(kEmergencies, json.encode(emergencies));
  }
}
