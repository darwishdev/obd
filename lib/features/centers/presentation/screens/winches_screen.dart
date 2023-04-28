import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/centers/presentation/screens/winches_view.dart';

@RoutePage()
class WinchesScreen extends StatelessWidget {
  const WinchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby winches',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const WinchesView(),
    );
  }
}
