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
    this.hiddenBackground = false,
    this.contentPadding,
    this.onLongPress,
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
  final bool hiddenBackground;

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
              borderRadius: BorderRadius.circular(100),
              color: backgroundColor,
              border: border,
              gradient: hiddenBackground
                  ? null
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        defaultGradientColor1.withOpacity(hiddenBackground ? 0.1 : 1),
                        defaultGradientColor2.withOpacity(hiddenBackground ? 0.1 : 1)
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
              right: size / 4,
              top: size / 1,
              child: notificationChild ?? Container(),
            )
        ],
      ),
    );
  }
}
