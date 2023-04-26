import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@RoutePage()
class LiveDataScreen extends StatelessWidget {
  const LiveDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return Container(
                        child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 1000,
                      axes: <RadialAxis>[
                        RadialAxis(
                            showAxisLine: false,
                            showLabels: false,
                            showTicks: false,
                            maximum: 190,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startWidth: 3,
                                endWidth: 5,
                                // color: Colors.red,
                                gradient: const SweepGradient(stops: [
                                  0.0,
                                  1.0
                                ], colors: [
                                  Color.fromARGB(255, 185, 1, 1),
                                  Color.fromARGB(255, 95, 4, 4),
                                ]),
                                startValue: 120,
                                endValue: 190,
                                rangeOffset: 10,
                              )
                            ]),
                        RadialAxis(
                            axisLineStyle: const AxisLineStyle(thickness: 10),
                            showTicks: true,
                            maximum: 190,
                            pointers: const <GaugePointer>[
                              NeedlePointer(
                                  value: 120,
                                  animationDuration: 1000,
                                  enableAnimation: true,
                                  needleStartWidth: 0,
                                  needleEndWidth: 5,
                                  needleColor: Color(0xFFDADADA),
                                  knobStyle: KnobStyle(
                                      color: Colors.white,
                                      borderColor:
                                          Color.fromARGB(255, 212, 199, 199),
                                      knobRadius: 0.06,
                                      borderWidth: 0.04),
                                  tailStyle: TailStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      width: 5,
                                      length: 0.15)),
                              RangePointer(
                                  value: 120,
                                  width: 15,
                                  enableAnimation: true,
                                  animationDuration: 1000,
                                  gradient: SweepGradient(stops: [
                                    0.0,
                                    1.0
                                  ], colors: [
                                    Color.fromARGB(255, 65, 158, 234),
                                    Color.fromARGB(255, 44, 106, 156),
                                  ]))
                            ])
                      ],
                    ));
                  },
                ),
                const RoundedBtn(icon: 'assets/images/scan.svg', text: "Scan"),

                // FaultCode(color: Color(0xff1cb4bf),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
