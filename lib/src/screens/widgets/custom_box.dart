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
    this.padding = const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
    this.margin,
    this.constraints,
  });
  final void Function()? onTap;
  final bool enableBorder;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final double? backgroundOpacity;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor.withOpacity(backgroundOpacity ?? 1),
        border: enableBorder
            ? Border.all(
                color: defaultShadowColor,
                width: 1,
                style: BorderStyle.solid,
              )
            : null,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
