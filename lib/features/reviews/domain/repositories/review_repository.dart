import 'package:dartz/dartz.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/domain/usecases/review_center.dart';
import 'package:obd/features/reviews/domain/usecases/reviews.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewModel>>> getReviews(ReviewsParams params);
  Future<Either<Failure, bool>> reviewCenter(CreateReviewParams params);
}
