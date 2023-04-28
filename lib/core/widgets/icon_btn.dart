import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBtn extends StatelessWidget {
  final String icon;
  final double? size;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const IconBtn({
    super.key,
    required this.icon,
    this.size,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 45,
        height: size ?? 45,
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 42, 101, 150).withAlpha(150),
              offset: const Offset(0, 4),
              blurRadius: 5.0,
            )
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
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
