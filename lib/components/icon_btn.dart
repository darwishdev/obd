import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBtn extends StatelessWidget {
  final String icon;
  final double? size;
  final double? padding;
  final void Function()? onPressed;
  const IconBtn(
      {super.key, required this.icon, this.size, this.padding, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: size ?? 45,
          height: size ?? 45,
          padding: EdgeInsets.all(padding ?? 7),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 42, 101, 150).withAlpha(150),
                  offset: const Offset(0, 4),
                  blurRadius: 5.0)
            ],
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              colors: [
                Color.fromARGB(255, 69, 160, 235),
                Color.fromARGB(255, 20, 48, 71)
              ],
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
          )),
    );
  }
}
