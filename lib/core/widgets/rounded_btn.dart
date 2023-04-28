import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/theme/constants.dart';

class RoundedBtn extends StatelessWidget {
  final String icon;
  final String text;
  final double? iconSize;
  final double? textSize;
  final Color? shadow;
  final void Function()? onPressed;

  const RoundedBtn({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.textSize,
    this.onPressed,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [AppTheme.mainShadow],
          gradient: AppTheme.mainGredient,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: iconSize ?? 30,
              height: iconSize ?? 30,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: textSize ?? 18),
            ),
          ],
        ),
      ),
    );
  }
}
