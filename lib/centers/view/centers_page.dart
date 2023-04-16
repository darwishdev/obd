import 'package:flutter/material.dart';
import 'package:obd/components/bottom_nav.dart';
import 'package:obd/components/center_partial.dart';

class CentersPage extends StatelessWidget {
  const CentersPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CentersPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: const Text('Centers'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Centers near you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
                CenterPartial(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
