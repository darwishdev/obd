import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/components/bottom_nav.dart';
import 'package:flutter_login/components/icon_btn.dart';
import 'package:flutter_login/login/login.dart';
import 'package:flutter_login/report/report.dart';
import 'package:flutter_login/theme/constants.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              );
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        "Your Scan history",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    HistoryTile(context, "1/05/2022 10:50:00" , "0" , "1"),
                    HistoryTile(context, "12/06/2022 08:30:00" , "0" , "2"),
                    HistoryTile(context, "18/08/2022 07:15:00" , "0" , "0"),
                    HistoryTile(context, "29/08/2022 07:00:00" , "1" , "3")
                    // FaultCode(color: Color(0xff1cb4bf),)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}

GestureDetector HistoryTile(BuildContext context, String date , String emergencies , String errors) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReportPage()),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [AppTheme.mainShadow],
          borderRadius: BorderRadius.circular(10),
          gradient: AppTheme.mainGredient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.punch_clock_outlined),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              Row(
                children: [
                  //           "assets/images/em-alert.svg"
                  // : "assets/images/alert.svg";
                  SvgPicture.asset(
                    "assets/images/em-alert.svg",
                    color: AppTheme.textColor,
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${emergencies} emergencies - ",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SvgPicture.asset(
                    "assets/images/alert.svg",
                    color: AppTheme.textColor,
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${errors} error",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
