import 'package:flutter/material.dart';
import 'package:flutter_login/components/slide_in.dart';
import 'package:flutter_login/history/history.dart';
import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/profile/view/profile_page.dart';
import 'package:flutter_login/reviews/review.dart';

class BottomNav extends StatelessWidget {
  final routes = [HomePage(), HistoryPage(), ReviewsPage(), ProfilePage()];
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff010001),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 15,
      unselectedFontSize: 14,
      onTap: (value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routes[value]),
        );
      },
      items: [
        BottomNavigationBarItem(
          label: 'home',
          icon: SlideIn(vertical: true, child: Icon(Icons.roofing)),
        ),
        BottomNavigationBarItem(
          label: 'history',
          icon: SlideIn(vertical: true, child: Icon(Icons.history_outlined)),
        ),
        BottomNavigationBarItem(
          label: 'reviews',
          icon: SlideIn(vertical: true, child: Icon(Icons.reviews_outlined)),
        ),
        BottomNavigationBarItem(
          label: 'profile',
          icon: SlideIn(
            vertical: true,
            child: Icon(
              Icons.person_outline,
            ),
          ),
        ),
      ],
    );
  }
}
