import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/repositories/session_repository_impl.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';

final sessionAttachCodeUseCaseProvider = Provider<SessionAttachCode>(
  (ref) => SessionAttachCode(ref.watch(sessionRepositoryImpl)),
);

class SessionAttachCode implements UseCase<bool, SessionAttachCodeParams> {
  final SessionRepository _sessionRepository;

  SessionAttachCode(this._sessionRepository);

  @override
  Future<Either<Failure, bool>> call(SessionAttachCodeParams params) async {
    return _sessionRepository.sessionAttachCode(params);
  }
}

class SessionAttachCodeParams {
  final int? sessionId;
  final String? codeIDs;

  const SessionAttachCodeParams({this.sessionId, this.codeIDs});
}
