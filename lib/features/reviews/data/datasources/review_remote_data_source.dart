import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/reviews/data/models/center_model.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/domain/usecases/centers.dart';
import 'package:obd/features/reviews/domain/usecases/review_center.dart';
import 'package:obd/features/reviews/domain/usecases/reviews.dart';
import 'package:obd/services/dio_client.dart';
import 'package:obd/utils/endpoints.dart';

abstract class ReviewRemoteDataSource {
  Future<List<ReviewModel>> getReviews(ReviewsParams params);
  Future<bool> reviewCenter(CreateReviewParams params);
  Future<List<CenterModel>> getCenters(CentersParams params);
}

final reviewRemoteDataSourceImpl = Provider<ReviewRemoteDataSourceImpl>(
  (ref) => ReviewRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final DioClient _dioClient;

  ReviewRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<ReviewModel>> getReviews(ReviewsParams params) async {
    final response = await _dioClient.dio.post(EndPoints.reviews, data: {});
    final reviews = <ReviewModel>[];
    for (final review in response.data['reviews']) {
      reviews.add(ReviewModel.fromJson(review));
    }
    return reviews;
  }

  @override
  Future<bool> reviewCenter(CreateReviewParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.reviewCreate,
      data: {
        "centerId": params.centerID,
        "review": params.review,
        "rate": params.rate,
      },
    );
    return true;
  }

  @override
  Future<List<CenterModel>> getCenters(CentersParams params) async {
    final response = await _dioClient.dio.post(
      EndPoints.centers,
      data: {
        "lat": params.lat,
        "long": params.long,
      },
    );
    final centers = <CenterModel>[];
    for (final center in response.data['centers']) {
      centers.add(CenterModel.fromJson(center));
    }
    return centers;
  }
}
