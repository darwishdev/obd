import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/core/models/view_states.dart';
import 'package:obd/core/widgets/form_field_widget.dart';
import 'package:obd/core/widgets/rounded_btn.dart';
import 'package:obd/features/centers/presentation/provider/selected_center_provider.dart';
import 'package:obd/features/centers/presentation/widgets/centers_drop_down_widget.dart';
import 'package:obd/features/reviews/domain/usecases/review_center.dart';
import 'package:obd/features/reviews/presentation/provider/review_center_provider.dart';
import 'package:obd/features/reviews/presentation/provider/reviews_provider.dart';
import 'package:obd/features/reviews/presentation/provider/selected_rate_provider.dart';
import 'package:obd/theme/dimensions.dart';
import 'package:obd/utils/ui_helper.dart';

@RoutePage()
class CreateReviewScreen extends ConsumerStatefulWidget {
  const CreateReviewScreen({
    Key? key,
    this.centerID,
    this.isProfile = true,
  }) : super(key: key);

  final bool isProfile;
  final int? centerID;
  @override
  ConsumerState<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends ConsumerState<CreateReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _reviewController.dispose();
  }

  _review() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (ref.read(selectedRateProvider.notifier).state == null) {
      EasyLoading.showError('Please select rate');
      return;
    }
    ref.read(reviewCenterProvider.notifier).reviewCenter(
          CreateReviewParams(
            centerID: widget.centerID ??
                ref.read(selectedCenterProvider.notifier).state!,
            review: _reviewController.text,
            rate: ref.read(selectedRateProvider.notifier).state!,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(reviewCenterProvider, (previous, state) {
      if (state is LoadingViewState) {
        UiHelper.showLoadingDialog(context);
      } else if (state is LoadedViewState) {
        Navigator.of(context)
          ..pop()
          ..pop();
        if (!widget.isProfile && widget.centerID == null) {
          ref.read(reviewsProvider.notifier).fetchReviews();
        } else if (widget.centerID != null) {
          ref.read(reviewsProvider.notifier).fetchReviews(
                centerID: widget.centerID,
              );
        }
        EasyLoading.showSuccess('Review successfully');
      } else if (state is ErrorViewState) {
        context.popRoute();
        EasyLoading.showError(state.errorMessage);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create review",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppDimensions.kSizeXLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RatingBar.builder(
                    minRating: 1,
                    itemCount: 5,
                    itemBuilder: (__, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      ref.watch(selectedRateProvider.notifier).state = rating;
                    },
                  ),
                ),
                const SizedBox(height: AppDimensions.kSizeMedium),
                CentersDropDownWidget(centerID: widget.centerID),
                const SizedBox(height: AppDimensions.kSizeMedium),
                FormFieldWidget(
                  controller: _reviewController,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter review";
                    }
                    return null;
                  },
                  prefixWidget: const Icon(Icons.reviews_outlined),
                  labelText: "review",
                  maxLines: 3,
                ),
                const SizedBox(height: AppDimensions.kSize4XLarge),
                RoundedBtn(
                  icon: "assets/images/submit.svg",
                  text: "Submit",
                  iconSize: 20,
                  onPressed: _review,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
