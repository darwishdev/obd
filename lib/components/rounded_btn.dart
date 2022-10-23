import 'package:flutter/material.dart';
import 'package:flutter_login/theme/constants.dart';
import 'package:flutter_svg/svg.dart';

class RoundedBtn extends StatelessWidget {
  final String icon;
  final String text;
  final double? iconSize;
  final double? textSize;
  final Color? color1;
  final Color? color2;

  final Color? shadow;
  final void Function()? onPressed;
  const RoundedBtn(
      {super.key,
      required this.icon,
      required this.text,
      this.iconSize,
      this.textSize,
      this.onPressed,
      this.color1,
      this.color2,
      this.shadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10 , vertical:  5),
        decoration: BoxDecoration(
          boxShadow: [
                          AppTheme.mainShadow
    
          ],
          gradient: AppTheme.mainGredient,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,
                width: iconSize ?? 30,
                height: iconSize ?? 30,
                color: Colors.white),
            SizedBox(
              width: 5,
            ),
            Text(text,
                style: TextStyle(color: Colors.white, fontSize: textSize ?? 18)),
          ],
        ),
      ),
    );
  }
}
