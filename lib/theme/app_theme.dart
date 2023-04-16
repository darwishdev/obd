import 'package:flutter/material.dart';

import 'themes.dart';

class OBDTheme extends StatelessWidget {
  final Widget? navigator;

  const OBDTheme({Key? key, required this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getThemeData(context),
      child: navigator!,
    );
  }
}
