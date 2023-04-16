import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/features/livedata/presentation/live_data_page.dart';

@RoutePage()
class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ConnectPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Before you connect",
            ),
            SizedBox(
              height: 40,
            ),
            Divider(),
            SizedBox(
              height: 40,
            ),

            //  SizedBox(height: 30,),
            //  Text("1 - Plug in the adapter to the OBD port" , style :Theme.of(context).textTheme.bodyText1),
            //  SizedBox(height: 10,),
            //  Text("2 - Turn on your vehivles engine" , style :Theme.of(context).textTheme.bodyText1),
            //  SizedBox(height: 10,),
            //  Text("3 - Make sure that bluetooth is on" , style :Theme.of(context).textTheme.bodyText1),
            SvgPicture.asset(
              "assets/images/obd.svg",
              color: Colors.white,
              width: 120,
            ),
            SizedBox(
              height: 20,
            ),
            StepTile('1 - Plug in the adapter to the OBD port'),
            SizedBox(
              height: 10,
            ),

            SvgPicture.asset(
              "assets/images/engine.svg",
              color: Colors.white,
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            StepTile('2 - Turn on your vehivles engine'),
            SizedBox(
              height: 10,
            ),

            SvgPicture.asset(
              "assets/images/bluetooth.svg",
              color: Colors.white,
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            StepTile('3 - Make sure that bluetooth is on'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: RoundedBtn(
            icon: "assets/images/bluetooth.svg",
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveDataScreen()),
              );
            },
            text: "connect",
          )),
    );
  }

  Container StepTile(String title) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          // boxShadow: [AppTheme.mainShadow],
          borderRadius: BorderRadius.circular(10),
          // gradient: AppTheme.mainGredient
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ));
  }
}
