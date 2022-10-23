import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SlideIn extends StatelessWidget {
  final Widget child;
  final bool ltr ;
  final bool vertical ;
  final Duration delay ;
  const SlideIn({Key? key , required this.child ,   this.ltr = false ,  this.vertical = false, this.delay = const Duration(milliseconds: 900)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
              animationDuration: Duration(seconds: 1),
              curve: Curves.easeOut,
              delayStart: delay,
              direction: vertical ? Direction.vertical :Direction.horizontal,
              offset: ltr ? -0.5 : 0.5,
              child: child
            );
  }
}