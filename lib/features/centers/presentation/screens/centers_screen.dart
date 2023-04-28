import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/centers/presentation/screens/centers_view.dart';

@RoutePage()
class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby centers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const CentersView(),
    );
  }
}
