import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/data/repositories/session_repository_impl.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';

final sessionCodeUseCaseProvider = Provider.autoDispose<SessionCode>(
  (ref) => SessionCode(ref.watch(sessionRepositoryImpl)),
);

class SessionCode
    implements UseCase<List<SessionCodeModel>, SessionCodeParams> {
  final SessionRepository _sessionRepository;

  SessionCode(this._sessionRepository);

  @override
  Future<Either<Failure, List<SessionCodeModel>>> call(
      SessionCodeParams params) async {
    return _sessionRepository.getSessionCode(params);
  }
}

class SessionCodeParams {
  final int? sessionId;

  const SessionCodeParams({this.sessionId});
}
