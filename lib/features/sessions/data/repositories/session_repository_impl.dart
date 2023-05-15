import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/sessions/data/datasources/session_remote_data_source.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/data/models/session_model.dart';
import 'package:obd/features/sessions/domain/repositories/session_repository.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_code.dart';
import 'package:obd/features/sessions/domain/usecases/session_attach_value.dart';
import 'package:obd/features/sessions/domain/usecases/session_code.dart';
import 'package:obd/features/sessions/domain/usecases/session_create.dart';

final sessionRepositoryImpl = Provider<SessionRepositoryImpl>(
  (ref) => SessionRepositoryImpl(
    ref.watch(sessionRemoteDataSourceImpl),
  ),
);

class SessionRepositoryImpl implements SessionRepository {
  final SessionRemoteDataSource _sessionRemoteDataSource;

  SessionRepositoryImpl(this._sessionRemoteDataSource);

  @override
  Future<Either<Failure, List<SessionModel>>> getSessions(
      NoParams params) async {
    try {
      final response = await _sessionRemoteDataSource.sessions(params);
      return Right(response);
    } catch (e) {
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SessionCodeModel>>> getSessionCode(
      SessionCodeParams params) async {
    try {
      final response = await _sessionRemoteDataSource.sessionCodes(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sessionAttachCode(
      SessionAttachCodeParams params) async {
    try {
      final response = await _sessionRemoteDataSource.sessionAttachCode(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sessionAttachValue(
      SessionAttachValueParams params) async {
    try {
      final response =
          await _sessionRemoteDataSource.sessionAttachValue(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> sessionCreate(SessionCreateParams params) async {
    try {
      final response = await _sessionRemoteDataSource.sessionCreate(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
