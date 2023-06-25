import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    this.size = 45,
    this.onTap,
    this.border,
    this.child,
    this.notificationChild,
    this.margin,
    this.backgroundColor,
  });
  final double size;

  final void Function()? onTap;
  final BoxBorder? border;
  final Widget? child;
  final Widget? notificationChild;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: backgroundColor ??
                  Theme.of(context).shadowColor.withOpacity(0.5),
            ),
            height: size,
            width: size,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: child,
              ),
            ),
          ),
          if (notificationChild != null)
            Positioned(
              right: size / 4,
              top: size / 1,
              child: notificationChild ?? Container(),
            )
        ],
      ),
    );
  }
}
