import 'dart:math';

import 'package:flutter/material.dart';
import 'package:obd/components/bottom_nav.dart';
import 'package:obd/components/icon_btn.dart';
import 'package:obd/components/rating.dart';
import 'package:obd/reviews/view/view.dart';
import 'package:obd/theme/constants.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReviewsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            "Your Rivews",
                          ),
                        ),
                        IconBtn(
                            icon: "assets/images/add.svg",
                            padding: 10,
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateReviewPage()),
                                ))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  ReviewTile(
                      context,
                      "Center 1",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris eget velit dolor.",
                      1),
                  ReviewTile(
                      context,
                      "Center 2",
                      " Nam vel fermentum sem. Orci varius natoque penatibus et magnis dis",
                      5),
                  ReviewTile(
                      context,
                      "Center 1",
                      "parturient montes, nascetur ridiculus mus. Curabitur laoreet magna ut interdum congue.",
                      2),
                  ReviewTile(context, "Center 4",
                      "Quisque nec ipsum risus. Pellentesque maximus, ", 3)
                  // FaultCode(color: Color(0xff1cb4bf),)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

Container ReviewTile(
    BuildContext context, String name, String review, int rating) {
  return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [AppTheme.mainShadow],
          borderRadius: BorderRadius.circular(10),
          gradient: AppTheme.mainGredient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              5 - rating > 2.5
                  ? Icon(Icons.thumb_down_outlined)
                  : Icon(Icons.thumb_up_outlined),
              SizedBox(
                width: 5,
              ),
              Text(name),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          StarRating(rating: rating, color: Color.fromARGB(255, 200, 200, 6)),
          Text(
            review,
            overflow: TextOverflow.fade,
            maxLines: 3,
            softWrap: true,
          )
        ],
      ));
}
