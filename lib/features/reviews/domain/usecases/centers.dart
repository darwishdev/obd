import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/reviews/data/models/center_model.dart';
import 'package:obd/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:obd/features/reviews/domain/repositories/review_repository.dart';

final centersUseCaseProvider = Provider.autoDispose<Centers>(
  (ref) => Centers(ref.watch(reviewRepositoryImpl)),
);

class Centers implements UseCase<List<CenterModel>, CentersParams> {
  final ReviewRepository _reviewRepository;

  Centers(this._reviewRepository);

  @override
  Future<Either<Failure, List<CenterModel>>> call(CentersParams params) async {
    return _reviewRepository.getCenters(params);
  }
}

class CentersParams {
  final double? long;
  final double? lat;

  const CentersParams({
    this.lat,
    this.long,
  });
}
