import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_code.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_value.dart';
import 'package:obd/features/sessions/domain/usecases/session_code.dart';
import 'package:obd/features/sessions/domain/usecases/session_create.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionModel>>> getSessions(NoParams params);
  Future<Either<Failure, bool>> sessionAttachCode(
      SessionAttachCodeParams params);
  Future<Either<Failure, bool>> sessionAttachValue(
      SessionAttachValueParams params);
  Future<Either<Failure, int>> sessionCreate(SessionCreateParams params);
  Future<Either<Failure, List<SessionCodeModel>>> getSessionCode(
      SessionCodeParams params);
}
