import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/domain/usecases/session_code.dart';
import 'package:obd/services/dio_client.dart';
import 'package:obd/utils/endpoints.dart';

abstract class SessionRemoteDataSource {
  Future<List<SessionModel>> sessions(NoParams params);
  Future<List<SessionCodeModel>> sessionCodes(SessionCodeParams params);
}

final sessionRemoteDataSourceImpl = Provider<SessionRemoteDataSourceImpl>(
  (ref) => SessionRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

class SessionRemoteDataSourceImpl implements SessionRemoteDataSource {
  final DioClient _dioClient;

  SessionRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<SessionModel>> sessions(NoParams params) async {
    final response = await _dioClient.dio.post(EndPoints.sessions, data: {});
    final sessions = <SessionModel>[];
    for (final session in response.data['sessions']) {
      sessions.add(SessionModel.fromJson(session));
    }
    return sessions;
  }

  @override
  Future<List<SessionCodeModel>> sessionCodes(SessionCodeParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.sessionCodes,
      data: {
        "sessionId": params.sessionId,
      },
    );
    final sessionCodes = <SessionCodeModel>[];
    for (final sessionCode in response.data['codes']) {
      sessionCodes.add(SessionCodeModel.fromJson(sessionCode));
    }
    return sessionCodes;
  }
}
