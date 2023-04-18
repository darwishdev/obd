import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/provider/base_provider.dart';
import 'package:obd/features/reviews/domain/usecases/review_center.dart';

final reviewCenterProvider =
    StateNotifierProvider.autoDispose<ReviewCenterProvider, ViewState>(
  (ref) => ReviewCenterProvider(ref.watch(reviewCenterUseCaseProvider)),
);

class ReviewCenterProvider extends BaseProvider<bool> {
  final ReviewCenter _reviewCenter;

  ReviewCenterProvider(this._reviewCenter);

  Future<void> reviewCenter(CreateReviewParams params) async {
    setLoadingState();
    final response = await _reviewCenter.call(params);
    response.fold(
      (failure) {
        setErrorState(failure.message);
      },
      setLoadedState,
    );
  }
}
