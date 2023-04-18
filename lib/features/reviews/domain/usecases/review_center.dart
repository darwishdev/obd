import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:obd/features/reviews/domain/repositories/review_repository.dart';

final reviewCenterUseCaseProvider = Provider.autoDispose<ReviewCenter>(
  (ref) => ReviewCenter(ref.watch(reviewRepositoryImpl)),
);

class ReviewCenter implements UseCase<bool, CreateReviewParams> {
  final ReviewRepository _reviewRepository;

  ReviewCenter(this._reviewRepository);

  @override
  Future<Either<Failure, bool>> call(CreateReviewParams params) async {
    return _reviewRepository.reviewCenter(params);
  }
}

class CreateReviewParams {
  final int centerID;
  final String review;
  final double rate;

  const CreateReviewParams({
    required this.centerID,
    required this.review,
    required this.rate,
  });
}
