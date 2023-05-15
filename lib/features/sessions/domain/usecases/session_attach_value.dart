import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/home/data/models/obd_model.dart';
import 'package:obd/features/sessions/data/repositories/session_repository_impl.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';

final sessionAttachValueUseCaseProvider =
    Provider.autoDispose<SessionAttachValue>(
  (ref) => SessionAttachValue(ref.watch(sessionRepositoryImpl)),
);

class SessionAttachValue implements UseCase<bool, SessionAttachValueParams> {
  final SessionRepository _sessionRepository;

  SessionAttachValue(this._sessionRepository);

  @override
  Future<Either<Failure, bool>> call(SessionAttachValueParams params) async {
    return _sessionRepository.sessionAttachValue(params);
  }
}

class SessionAttachValueParams {
  final int? sessionId;
  final OBDModel? obdInfo;

  const SessionAttachValueParams({this.sessionId, this.obdInfo});
}
