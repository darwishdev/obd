import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/features/sessions/presentation/widgets/report_view.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen(this.sessionId, {super.key});

  final int? sessionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scan Result',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ReportView(id: sessionId),
      ),
    );
  }
}
