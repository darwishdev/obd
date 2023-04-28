import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/features/centers/domain/usecases/centers.dart';
import 'package:obd/features/centers/domain/usecases/winches.dart';

abstract class CenterRepository {
  Future<Either<Failure, List<WinchModel>>> winches(WinchesParams params);
  Future<Either<Failure, List<CenterModel>>> centers(CentersParams params);
}
