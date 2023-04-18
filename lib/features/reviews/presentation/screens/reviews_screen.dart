import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/reviews/presentation/widgets/reviews_view.dart';
import 'package:obd/routes/app_router.gr.dart';

@RoutePage()
class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Reviews',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => context.router.push(
              CreateReviewRoute(isProfile: false),
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const ReviewsView(),
    );
  }
}
