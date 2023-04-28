import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/features/reviews/presentation/provider/reviews_provider.dart';
import 'package:obd/features/reviews/presentation/widgets/review_card.dart';
import 'package:obd/utils/ui_helper.dart';

class ReviewsView extends ConsumerStatefulWidget {
  const ReviewsView({
    Key? key,
    this.centerID,
  }) : super(key: key);

  final int? centerID;
  @override
  ConsumerState<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends ConsumerState<ReviewsView> {
  @override
  void initState() {
    super.initState();
    UiHelper.postBuildCallback((p0) {
      ref.read(reviewsProvider.notifier).fetchReviews(
            centerID: widget.centerID,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewsProvider);
    if (state is LoadingViewState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorViewState) {
      return const Center(
        child: Text('There is no reviews yet'),
      );
    }
    if (state is LoadedViewState<List<ReviewModel>>) {
      return ListView.separated(
        itemCount: state.data.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        separatorBuilder: (_, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ReviewCard(state.data[index]);
        },
      );
    }
    return const SizedBox();
  }
}
