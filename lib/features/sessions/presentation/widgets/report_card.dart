import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/core/widgets/icon_btn.dart';
import 'package:obd/core/widgets/rounded_btn.dart';
import 'package:obd/features/sessions/data/models/session_code_model.dart';
import 'package:obd/routes/app_router.gr.dart';
import 'package:obd/theme/constants.dart';
import 'package:obd/utils/link_launcher.dart';

class ReportCard extends StatefulWidget {
  final SessionCodeModel model;
  const ReportCard(this.model, {super.key});

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: widget.model.isEmergency ?? false
            ? AppTheme.redGradient
            : AppTheme.yellowGradient,
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        childrenPadding: const EdgeInsets.all(10),
        tilePadding: const EdgeInsets.all(10),
        textColor: Colors.amber,
        leading: SvgPicture.asset(
          widget.model.isEmergency ?? false
              ? "assets/images/em-alert.svg"
              : "assets/images/alert.svg",
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          widget.model.codeName ?? "",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.model.vehiclePart ?? "",
          style: const TextStyle(fontSize: 14),
        ),
        trailing: IconBtn(
          icon: widget.model.isEmergency ?? false
              ? "assets/images/winch.svg"
              : "assets/images/centers.svg",
        ),
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/car.svg",
                width: 100,
                height: 100,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.model.description ?? "",
                  style: const TextStyle(color: Colors.white),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RoundedBtn(
                  onPressed: widget.model.isEmergency ?? false
                      ? () => context.router.push(const WinchesRoute())
                      : () => context.router.push(const CentersRoute()),
                  textSize: 14,
                  icon: widget.model.isEmergency ?? false
                      ? "assets/images/winch.svg"
                      : "assets/images/centers.svg",
                  text: widget.model.isEmergency ?? false
                      ? "Call emergency - Winch"
                      : "View nearest centers",
                ),
              ),
              const SizedBox(width: 20),
              IconBtn(
                icon: "assets/images/google.svg",
                onTap: () =>
                    LinkLauncher.launchGoogleSearch(widget.model.codeName),
              )
            ],
          ),
        ],
      ),
    );
  }
}
