import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    super.key,
    this.enableBorder = true,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.backgroundOpacity,
  });
  final void Function()? onTap;
  final bool enableBorder;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final double? backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).canvasColor.withOpacity(backgroundOpacity ?? 1),
        border: enableBorder ? const BorderDirectional(bottom: BorderSide(color: defaultShadowColor, width: 1)) : null,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
