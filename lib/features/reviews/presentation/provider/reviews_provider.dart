import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/domain/usecases/reviews.dart';

final reviewsProvider =
    StateNotifierProvider.autoDispose<ReviewsProvider, ViewState>((ref) {
  return ReviewsProvider(ref.watch(reviewsUseCaseProvider));
});

class ReviewsProvider extends BaseProvider<List<ReviewModel>> {
  final Reviews _reviews;

  ReviewsProvider(this._reviews);

  Future<void> fetchReviews({int? centerID}) async {
    setLoadingState();
    final response = await _reviews.call(
      ReviewsParams(centerID: centerID),
    );
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }
}
