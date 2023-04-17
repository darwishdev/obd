import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/routes/app_router.gr.dart';

@RoutePage()
class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        LiveDataRoute(),
        HomeRoute(),
        HistoryRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          unselectedItemColor: Colors.white.withOpacity(.60),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
              backgroundColor: Color(0xff010001),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart),
              label: 'Live Data',
              backgroundColor: Color(0xff010001),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Color(0xff010001),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color(0xff010001),
            ),
          ],
        );
      },
    );
  }
}
