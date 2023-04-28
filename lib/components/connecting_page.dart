import 'package:flutter/material.dart';

class ConnectingPage extends StatelessWidget {
  const ConnectingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Connecting'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Before you connect",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text("1 - Plug in the adapter to the flutter_login port"),
            SizedBox(
              height: 10,
            ),
            Text("2 - Turn on your vehivles engine"),
            SizedBox(
              height: 10,
            ),
            Text("3 - Make sure that bluetooth is on")
          ],
        ),
      ),
    );
  }
}
