import 'package:flutter/material.dart';
import 'package:obd/reviews/view/view.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateReviewPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ReviewForm(),
      ),
    );
  }
}
