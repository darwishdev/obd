import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:obd/core/widgets/icon_btn.dart';
import 'package:obd/features/centers/data/models/center_model.dart';
import 'package:obd/routes/app_router.gr.dart';
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
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                // center.image ?? '',
                'https://static.exploremelon.com/carbrain/static-center-logo.png.png',
                fit: BoxFit.cover,
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) {
                  return const IconBtn(icon: "assets/images/centers.svg");
                },
              ),
            ),
          ),
          title: Text(center.name ?? ''),
          subtitle: RatingBarIndicator(
            rating: double.tryParse(center.rate?.toString() ?? '') ?? 0.0,
            itemBuilder: (_, i) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () =>
                    LinkLauncher.launchMap(center.lat, center.long),
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
          onTap: () => context.router.push(CenterDetailsRoute(center: center))),
    );
  }
}
