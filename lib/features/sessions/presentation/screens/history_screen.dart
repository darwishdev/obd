import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/sessions/presentation/widgets/history_view.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan history',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const HistoryView(),
    );
  }
}
