import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/core/usecases/usecase.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/data/repositories/review_repository_impl.dart';
import 'package:obd/features/reviews/domain/repositories/review_repository.dart';

final reviewsUseCaseProvider = Provider.autoDispose<Reviews>(
  (ref) => Reviews(ref.watch(reviewRepositoryImpl)),
);

class Reviews implements UseCase<List<ReviewModel>, ReviewsParams> {
  final ReviewRepository _reviewRepository;

  Reviews(this._reviewRepository);

  @override
  Future<Either<Failure, List<ReviewModel>>> call(ReviewsParams params) async {
    return _reviewRepository.getReviews(params);
  }
}

class ReviewsParams {
  final int? centerID;

  const ReviewsParams({
    this.centerID,
  });
}
