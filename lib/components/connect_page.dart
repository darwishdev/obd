import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/components/live_data_page.dart';
import 'package:obd/core/widgets/rounded_btn.dart';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Before you connect",
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            StepTile('1 - Plug in the adapter to the OBD port'),
            const SizedBox(
              height: 10,
            ),

            SvgPicture.asset(
              "assets/images/engine.svg",
              color: Colors.white,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            StepTile('2 - Turn on your vehivles engine'),
            const SizedBox(
              height: 10,
            ),

            SvgPicture.asset(
              "assets/images/bluetooth.svg",
              color: Colors.white,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            StepTile('3 - Make sure that bluetooth is on'),
            const SizedBox(
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
                MaterialPageRoute(builder: (context) => const LiveDataScreen()),
              );
            },
            text: "connect",
          )),
    );
  }

  Container StepTile(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          // boxShadow: [AppTheme.mainShadow],
          borderRadius: BorderRadius.circular(10),
          // gradient: AppTheme.mainGredient
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
