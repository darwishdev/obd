import 'package:flutter/material.dart';
import 'package:obd/theme/constants.dart';

class ListTileInkWidget extends StatelessWidget {
  const ListTileInkWidget({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        shadows: [AppTheme.mainShadow],
        gradient: AppTheme.mainGredient,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: child,
    );
  }
}
