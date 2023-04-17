import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleBtn extends StatelessWidget {
  final String icon;
  final double? size;
  final double? iconSize;
  final void Function()? onPressed;
  const CircleBtn(
      {super.key,
      required this.icon,
      this.size,
      this.iconSize,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all(Size(size ?? 40.0, size ?? 40.0)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      child: SvgPicture.asset(icon,
          width: iconSize ?? 30.0,
          height: iconSize ?? 30.0,
          color: Colors.white),
    );
  }
}
