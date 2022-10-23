import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/centers/view/centers_page.dart';
import 'package:flutter_login/components/bottom_nav.dart';
import 'package:flutter_login/components/center_partial.dart';
import 'package:flutter_login/components/fault_code.dart';
import 'package:flutter_login/connect/connect.dart';
import 'package:flutter_login/history/history.dart';
import 'package:flutter_login/report/report.dart';
import 'package:flutter_login/reviews/view/view.dart';
import 'package:flutter_login/theme/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   title: const Text('Profile'),
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(200, 54, 49, 49),
                              blurRadius: 4,
                              offset: Offset(2, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 75,
                            child: Image.asset(
                              'assets/images/profile.jpg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Ahmed Darwish")
                    ],
                  ),
                ),
                ProfileTile("edit cart info", "assets/images/car.svg", () {}),
                ProfileTile("Your Reviews", "assets/images/review.svg",  () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReviewsPage()),
                  );
                }),
                ProfileTile("Add Review", "assets/images/review.svg",  () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateReviewPage()),
                  );
                }),
                ProfileTile("Connect", "assets/images/connect.svg", () {}),
                ProfileTile("Scan History", "assets/images/history.svg", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryPage()),
                  );
                })
                // FaultCode(color: Color(0xff1cb4bf),)
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNav());
  }

  GestureDetector ProfileTile(
      String title, String image, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            boxShadow: [AppTheme.mainShadow],
            borderRadius: BorderRadius.circular(10),
            gradient: AppTheme.mainGredient),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(title , style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
