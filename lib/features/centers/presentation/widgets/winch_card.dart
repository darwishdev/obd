import 'package:flutter/material.dart';
import 'package:obd/features/centers/data/models/winch_model.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/link_launcher.dart';

class WinchCard extends StatelessWidget {
  const WinchCard(this.winch, {super.key});

  final WinchModel winch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppTheme.mainShadow],
        gradient: AppTheme.mainGredient,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          winch.name ?? '',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            if (winch.driverName != null)
              Row(
                children: [
                  const Icon(Icons.person, size: 20),
                  const SizedBox(width: 5),
                  Text(winch.driverName!),
                ],
              ),
            const SizedBox(height: 7),
            if (winch.driverPhone != null)
              Row(
                children: [
                  const Icon(Icons.phone, size: 20),
                  const SizedBox(width: 5),
                  Text(winch.driverPhone!),
                ],
              ),
            const SizedBox(height: 7),
            Row(
              children: [
                const Icon(
                  Icons.map,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text('${winch.distance ?? ''} km'),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => LinkLauncher.launchMap(winch.lat, winch.long),
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => LinkLauncher.makeCall(winch.phone),
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
