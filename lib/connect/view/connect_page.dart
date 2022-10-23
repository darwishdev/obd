import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ConnectPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Connect'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Text("Before you connect" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
           SizedBox(height: 30,),
           Text("1 - Plug in the adapter to the flutter_login port"),
           SizedBox(height: 10,),
           Text("2 - Turn on your vehivles engine"),
           SizedBox(height: 10,),
           Text("3 - Make sure that bluetooth is on")
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items:[
        BottomNavigationBarItem(label : "home" , icon: Icon(Icons.home)),
        BottomNavigationBarItem(label : "home" , icon: Icon(Icons.home)),
        BottomNavigationBarItem(label : "home" , icon: Icon(Icons.home)),
        BottomNavigationBarItem(label : "home" , icon: Icon(Icons.home)),
      ]),
    );
  }
}
