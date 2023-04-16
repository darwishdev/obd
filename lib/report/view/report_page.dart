import 'package:flutter/material.dart';
import 'package:obd/components/bottom_nav.dart';
import 'package:obd/components/fault_code.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReportPage());
  }

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
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
      bottomNavigationBar: BottomNav(),
    );
  }
}
