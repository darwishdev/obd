import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/components/fault_code.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen(this.sessionId, {super.key});

  final int? sessionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Scan Result',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                "Emergencies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              FaultCode(
                isEmergency: true,
              ),
              FaultCode(
                isEmergency: true,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Default codes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              FaultCode(
                isEmergency: false,
              ),
              FaultCode(
                isEmergency: false,
              ),
              FaultCode(
                isEmergency: false,
              ),
              FaultCode(
                isEmergency: false,
              ),
              FaultCode(
                isEmergency: false,
              ),
              FaultCode(
                isEmergency: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
