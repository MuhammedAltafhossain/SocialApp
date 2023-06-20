import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/component.dart';

class CustomBox extends StatelessWidget {
  final void Function()? onTap;
  final bool enableBorder;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  const CustomBox({
    super.key,
    this.enableBorder = true,
    this.onTap,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
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
