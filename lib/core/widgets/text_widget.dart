import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? fontSize;
  final TextOverflow? overflow;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int? maxLines;

  const TextWidget(this.title,
      {Key? key,
      this.textAlign,
      this.textDirection,
      this.fontSize,
      this.overflow,
      this.fontWeight,
      this.fontFamily,
      this.color,
      this.maxLines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize ?? 16,
            fontFamily: fontFamily,
          ),
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
    );
  }
}
