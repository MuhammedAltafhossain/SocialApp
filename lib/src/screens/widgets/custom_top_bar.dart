import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
    this.endingAction = const [],
    this.titleText,
    this.enableBorder = true,
    this.bottomChild,
    this.leadingAction = const [],
    this.leadingWidget,
    this.backgroundColor,
    this.backgroundOpacity,
  });

  final List<Widget> endingAction;
  final List<Widget> leadingAction;
  final Widget? leadingWidget;
  final Widget? bottomChild;
  final String? titleText;
  final Color? backgroundColor;
  final bool enableBorder;
  final double? backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      backgroundOpacity: backgroundOpacity,
      backgroundColor: backgroundColor,
      enableBorder: enableBorder,
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Stack(
              children: [
                Row(
                  children: [
                    for (Widget w in leadingAction) w,
                    if (leadingWidget != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: leadingWidget!,
                        ),
                      ),
                  ],
                ),
                if (titleText != null)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          titleText!,
                          style: largeSubTitle,
                        )),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: endingAction,
                )
              ],
            ),
          ),
          if (bottomChild != null) const SizedBox(height: defaultPadding),
          if (bottomChild != null) bottomChild!,
        ],
      ),
    );
  }
}
