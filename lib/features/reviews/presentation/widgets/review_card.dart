import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:obd/features/reviews/data/models/review_model.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/helper_functions.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(this.review, {Key? key}) : super(key: key);

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppTheme.mainShadow],
        gradient: AppTheme.mainGredient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  review.centerName ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              RatingBarIndicator(
                rating: double.tryParse(review.rate?.toString() ?? '') ?? 0.0,
                itemBuilder: (_, i) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.review ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                HelperFunctions.formatDate(review.createdAt),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
