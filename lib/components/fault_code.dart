import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/centers/centers.dart';
import 'package:obd/components/icon_btn.dart';
import 'package:obd/components/rounded_btn.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/helpers.dart';

class FaultCode extends StatefulWidget {
  final bool isEmergency;
  const FaultCode({super.key, required this.isEmergency});

  @override
  State<FaultCode> createState() => _FaultCodeState();
}

class _FaultCodeState extends State<FaultCode> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    var icon = widget.isEmergency
        ? "assets/images/em-alert.svg"
        : "assets/images/alert.svg";
    var btnIcon = widget.isEmergency
        ? "assets/images/winch.svg"
        : "assets/images/centers.svg";
    var btnText = widget.isEmergency ? "Winch" : "centers";
    var btnAction = widget.isEmergency
        ? () => launchPhoneDialer("+201022052546")
        : () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CentersPage()),
            );
    var headerText = widget.isEmergency ? "C1660 - Engine " : "P0132 - Engine ";
    var contentText = widget.isEmergency ? "Winch" : "centers";
    var btnExpandedText =
        widget.isEmergency ? "Call  emergency - Winch" : "View nearest centers";

    var gredientBg =
        widget.isEmergency ? AppTheme.redGradient : AppTheme().yellowGradient;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: widget.isEmergency ? Color(0xffd00000) : Color(0xff1cb4bf),
            gradient: gredientBg,
          ),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _showContent = !_showContent;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showContent = !_showContent;
                          });
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(icon,
                                width: 20, height: 20, color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(headerText),
                                if (!_showContent)
                                  const Text(
                                    "header Text header Text ",
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          if (!_showContent)
                            IconBtn(
                              icon: btnIcon,
                              onPressed: () {
                                print("call");
                              },
                            ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showContent = !_showContent;
                                });
                              },
                              child: Icon(_showContent
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down)),
                        ],
                      ),
                    ],
                  )),
              if (_showContent)
                const SizedBox(
                  height: 10,
                ),
              //  Divider(),
              if (_showContent)
                const Divider(
                  thickness: 1,
                ),
              if (_showContent)
                Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/car.svg",
                          width: 100,
                          height: 100,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // Text("Fault Code Title"),
                        Flexible(
                          child: Text(
                            "C1660 engine trouble code is about Exhaust Gas Recirculation Sensor B Circuit High. O2 Sensor Heater Circuit Malfunction and Injection Pump Fuel Metering Control 'A' High (Cam/Rotor/Injector) causes most of code C1660",
                            style: Theme.of(context).textTheme.bodyLarge,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundedBtn(
                            onPressed: btnAction,
                            textSize: 14,
                            icon: btnIcon,
                            text: btnExpandedText,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const IconBtn(icon: "assets/images/google.svg")
                      ],
                    ),
                  ],
                ),
            ],
          )),
    );
  }
}
