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
    this.borderColor = defaultShadowColor,
    this.borderWidth = 0.5,
    this.borderTop = true,
    this.borderBottom = true,
    this.borderLeft = true,
    this.borderRight = true,
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
  final Color borderColor;
  final double borderWidth;
  final bool borderTop;
  final bool borderBottom;
  final bool borderLeft;
  final bool borderRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor.withOpacity(backgroundOpacity ?? 1),
        border: enableBorder
            ? Border(
                top: BorderSide(
                  color: borderColor,
                  width: borderTop ? borderWidth : 0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                bottom: BorderSide(
                  color: borderColor,
                  width: borderBottom ? borderWidth : 0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                left: BorderSide(
                  color: borderColor,
                  width: borderLeft ? borderWidth : 0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                right: BorderSide(
                  color: borderColor,
                  width: borderRight ? borderWidth : 0,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
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
