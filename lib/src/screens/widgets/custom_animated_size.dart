import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

class CustomAnimatedSize extends StatelessWidget {
  const CustomAnimatedSize({super.key, this.child, this.alignment = Alignment.center});
  final Widget? child;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: alignment,
      duration: const Duration(milliseconds: defaultDuration),
      child: child,
    );
  }
}
