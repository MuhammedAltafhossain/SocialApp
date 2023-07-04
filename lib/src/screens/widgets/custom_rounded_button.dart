import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

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
    this.hiddenBackgroundGradient = false,
    this.contentPadding,
    this.onLongPress,
    this.boxShadow,
  });
  final double size;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final BoxBorder? border;
  final Widget? child;
  final Widget? notificationChild;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool hiddenBackgroundGradient;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: size,
            width: size,
            padding: contentPadding,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor,
              border: border,
              gradient: hiddenBackgroundGradient
                  ? null
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        defaultGradientColor1.withOpacity(hiddenBackgroundGradient ? 0.1 : 1),
                        defaultGradientColor2.withOpacity(hiddenBackgroundGradient ? 0.1 : 1)
                      ],
                    ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                onLongPress: onLongPress,
                child: child,
              ),
            ),
          ),
          if (notificationChild != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: notificationChild ?? Container(),
            )
        ],
      ),
    );
  }
}
