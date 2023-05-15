import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/core/widgets/rounded_btn.dart';
import 'package:obd/features/home/presentation/provider/obd_reader_provider.dart';

class CheckConnectWidget extends StatelessWidget {
  const CheckConnectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Before you connect"),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 30),
          SvgPicture.asset(
            "assets/images/obd.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            '1 - Plug in the adapter to the OBD port',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 50),
          SvgPicture.asset(
            "assets/images/engine.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            '2 - Turn on your vehivles engine',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 50),
          SvgPicture.asset(
            "assets/images/bluetooth.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            '3 - Make sure that bluetooth is on',
            style: TextStyle(color: Colors.white),
          ),
          Consumer(builder: (context, ref, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: RoundedBtn(
                icon: "assets/images/bluetooth.svg",
                iconSize: 30,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                onPressed: () =>
                    ref.read(obdReaderProvider.notifier).startOBD(),
                text: "connect",
              ),
            );
          }),
        ],
      ),
    );
  }
}
