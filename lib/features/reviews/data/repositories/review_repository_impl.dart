import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/errors/failure.dart';
import 'package:obd/features/reviews/data/datasources/review_remote_data_source.dart';
import 'package:obd/features/reviews/data/models/center_model.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/domain/repositories/review_repository.dart';
import 'package:obd/features/reviews/domain/usecases/centers.dart';
import 'package:obd/features/reviews/domain/usecases/review_center.dart';
import 'package:obd/features/reviews/domain/usecases/reviews.dart';

final reviewRepositoryImpl = Provider<ReviewRepositoryImpl>(
  (ref) => ReviewRepositoryImpl(
    ref.watch(reviewRemoteDataSourceImpl),
  ),
);

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource _reviewRemoteDataSource;

  ReviewRepositoryImpl(this._reviewRemoteDataSource);

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews(
      ReviewsParams params) async {
    try {
      final response = await _reviewRemoteDataSource.getReviews(params);
      return Right(response);
    } catch (e) {
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CenterModel>>> getCenters(
      CentersParams params) async {
    try {
      final response = await _reviewRemoteDataSource.getCenters(params);
      return Right(response);
    } catch (e) {
      return Left(OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> reviewCenter(CreateReviewParams params) async {
    try {
      final response = await _reviewRemoteDataSource.reviewCenter(params);
      return Right(response);
    } catch (e) {
      //TODO handle error
      return Left(OtherFailure(message: e.toString()));
    }
  }
}
