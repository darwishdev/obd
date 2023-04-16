import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/cars/cars.dart';
import 'package:obd/connect/connect.dart';
import 'package:obd/features/history/presentation/history_page.dart';
import 'package:obd/reviews/view/view.dart';
import 'package:obd/theme/constants.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfileScreen());
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
              ProfileTile("edit car info", "assets/images/car.svg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditCarPage()),
                );
              }),

              ProfileTile("Your Reviews", "assets/images/review.svg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReviewsPage()),
                );
              }),
              ProfileTile("Add Review", "assets/images/review.svg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateReviewPage()),
                );
              }),
              ProfileTile("Connect", "assets/images/connect.svg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConnectPage()),
                );
              }),
              ProfileTile("Scan History", "assets/images/history.svg", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen()),
                );
              }),
              // ProfileTile("Signout", "assets/images/logout.svg", () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const LoginScreen()),
              //   );
              // })
              // FaultCode(color: Color(0xff1cb4bf),)
            ],
          ),
        ),
      ),
    );
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
            Text(
              title,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
