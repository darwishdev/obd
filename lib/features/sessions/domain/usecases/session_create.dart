import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/repositories/session_repository_impl.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';

final sessionCreateUseCaseProvider = Provider<SessionCreate>(
  (ref) => SessionCreate(ref.watch(sessionRepositoryImpl)),
);

class SessionCreate implements UseCase<int, SessionCreateParams> {
  final SessionRepository _sessionRepository;

  SessionCreate(this._sessionRepository);

  @override
  Future<Either<Failure, int>> call(SessionCreateParams params) async {
    return _sessionRepository.sessionCreate(params);
  }
}

class SessionCreateParams {
  final bool isLive;

  const SessionCreateParams(this.isLive);
}
