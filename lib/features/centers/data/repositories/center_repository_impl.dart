import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/centers/data/datasources/center_remote_data_source.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/domain/repositories/center_repository.dart';
import 'package:obd/features/centers/domain/usecases/centers.dart';
import 'package:obd/features/centers/domain/usecases/winches.dart';

final centerRepositoryImpl = Provider<CenterRepositoryImpl>(
  (ref) => CenterRepositoryImpl(
    ref.watch(centerRemoteDataSourceImpl),
  ),
);

class CenterRepositoryImpl implements CenterRepository {
  final CenterRemoteDataSource _centerRemoteDataSource;

  CenterRepositoryImpl(this._centerRemoteDataSource);

  @override
  Future<Either<Failure, List<CenterModel>>> centers(
      CentersParams params) async {
    try {
      final response = await _centerRemoteDataSource.centers(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WinchModel>>> winches(
      WinchesParams params) async {
    try {
      final response = await _centerRemoteDataSource.winches(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
