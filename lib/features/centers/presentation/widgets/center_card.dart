import 'package:flutter/material.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/link_launcher.dart';

class CenterCard extends StatelessWidget {
  const CenterCard(this.center, {super.key});

  final CenterModel center;
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(center.name ?? ''),
        subtitle: Text(center.address ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => LinkLauncher.launchMap(center.lat, center.long),
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => LinkLauncher.makeCall(center.phone),
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
