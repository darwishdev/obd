import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obd/features/home/presentation/provider/obd_reader_provider.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/features/sessions/presentation/widgets/report_card.dart';
import 'package:obd/services/shared_prefs.dart';
import 'package:obd/utils/storage_keys_constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@RoutePage()
class OBDInfoScreen extends ConsumerStatefulWidget {
  const OBDInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<OBDInfoScreen> createState() => _OBDInfoScreenState();
}

class _OBDInfoScreenState extends ConsumerState<OBDInfoScreen> {
  List<SessionCodeModel>? get _sessions {
    final emergencies = ref.watch(sharedPrefsProvider).getString(kEmergencies);
    if (emergencies == null) return null;
    final sessionCodes = <SessionCodeModel>[];
    for (final sessionCode in json.decode(emergencies)) {
      sessionCodes.add(SessionCodeModel.fromJson(sessionCode));
    }
    return sessionCodes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OBD Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ref.watch(obdInfoProvider).when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
              data: (info) => ListView(
                children: [
                  SfRadialGauge(
                    enableLoadingAnimation: true,
                    title: const GaugeTitle(text: "RPM"),
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 12,
                        labelOffset: 30,
                        axisLineStyle: const AxisLineStyle(
                          thicknessUnit: GaugeSizeUnit.factor,
                          thickness: 0.03,
                        ),
                        majorTickStyle: const MajorTickStyle(
                          length: 6,
                          thickness: 4,
                          color: Colors.white,
                        ),
                        minorTickStyle: const MinorTickStyle(
                          length: 3,
                          thickness: 3,
                          color: Colors.white,
                        ),
                        axisLabelStyle: const GaugeTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 12,
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.03,
                            endWidth: 0.03,
                            gradient: const SweepGradient(
                              colors: <Color>[
                                Colors.green,
                                Colors.yellow,
                                Colors.red
                              ],
                              stops: <double>[0.0, 0.2, 1],
                            ),
                          )
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: double.parse(info?.rpm ?? "0.0") / 1000,
                            needleLength: 0.95,
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            needleStartWidth: 1.5,
                            needleEndWidth: 6,
                            needleColor: Colors.red,
                            knobStyle: const KnobStyle(knobRadius: 0.09),
                          )
                        ],
                      )
                    ],
                  ),
                  SfRadialGauge(
                    enableLoadingAnimation: true,
                    title: const GaugeTitle(text: "Speed"),
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 320,
                        labelOffset: 20,
                        axisLineStyle: const AxisLineStyle(
                          thicknessUnit: GaugeSizeUnit.factor,
                          thickness: 0.03,
                        ),
                        majorTickStyle: const MajorTickStyle(
                          length: 6,
                          thickness: 4,
                          color: Colors.white,
                        ),
                        minorTickStyle: const MinorTickStyle(
                          length: 3,
                          thickness: 3,
                          color: Colors.white,
                        ),
                        axisLabelStyle: const GaugeTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 320,
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.03,
                            endWidth: 0.03,
                            gradient: const SweepGradient(
                              colors: <Color>[
                                Colors.green,
                                Colors.yellow,
                                Colors.red
                              ],
                              stops: <double>[0.0, 0.5, 1],
                            ),
                          )
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: double.parse(info?.speed ?? "0.0"),
                            needleLength: 0.95,
                            enableAnimation: true,
                            animationType: AnimationType.ease,
                            needleStartWidth: 1.5,
                            needleEndWidth: 6,
                            needleColor: Colors.red,
                            knobStyle: const KnobStyle(knobRadius: 0.09),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        const TextSpan(text: 'The Intake Air Temp: '),
                        TextSpan(
                          text: info?.airIntakeTemp ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        const TextSpan(text: 'The Engine Load: '),
                        TextSpan(
                          text: info?.engineLoad ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  if (_sessions != null)
                    ..._sessions!.map((item) => ReportCard(item)).toList(),
                ],
              ),
            ),
      ),
    );
  }
}
