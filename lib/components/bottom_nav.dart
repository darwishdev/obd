import 'package:flutter/material.dart';
import 'package:obd/components/slide_in.dart';
import 'package:obd/history/history.dart';
import 'package:obd/home/home.dart';
import 'package:obd/livedata/view/live_data_page.dart';
import 'package:obd/profile/view/profile_page.dart';

class BottomNav extends StatelessWidget {
  final routes = [LiveData(), HomePage(), HistoryPage(), ProfilePage()];
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff010001),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 13,
      onTap: (value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routes[value]),
        );
      },
      items: [
        BottomNavigationBarItem(
          label: 'dashboard',
          icon: SlideIn(vertical: true, child: Icon(Icons.pie_chart)),
        ),
        BottomNavigationBarItem(
          label: 'live data',
          icon: SlideIn(vertical: true, child: Icon(Icons.stacked_line_chart)),
        ),
        BottomNavigationBarItem(
          label: 'history',
          icon: SlideIn(vertical: true, child: Icon(Icons.history_outlined)),
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
