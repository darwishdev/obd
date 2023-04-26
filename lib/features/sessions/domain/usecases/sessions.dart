import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/data/repositories/session_repository_impl.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';

final sessionsUseCaseProvider = Provider.autoDispose<Sessions>(
  (ref) => Sessions(ref.watch(sessionRepositoryImpl)),
);

class Sessions implements UseCase<List<SessionModel>, NoParams> {
  final SessionRepository _sessionRepository;

  Sessions(this._sessionRepository);

  @override
  Future<Either<Failure, List<SessionModel>>> call(NoParams params) async {
    return _sessionRepository.getSessions(params);
  }
}
