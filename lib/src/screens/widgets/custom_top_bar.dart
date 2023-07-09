import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_animated_size.dart';
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
    this.padding = defaultPadding,
  });

  final List<Widget> endingAction;
  final List<Widget> leadingAction;
  final Widget? leadingWidget;
  final Widget? bottomChild;
  final String? titleText;
  final Color? backgroundColor;
  final bool enableBorder;
  final double? backgroundOpacity;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: defaultPadding),
      constraints: BoxConstraints(minHeight: 96 + MediaQuery.of(context).padding.top),
      backgroundOpacity: backgroundOpacity,
      backgroundColor: backgroundColor,
      enableBorder: enableBorder,
      borderTop: false,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      for (Widget w in leadingAction) w,
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: leadingAction.isEmpty ? 0 : defaultPadding),
                          child: leadingWidget == null ? const SizedBox() : leadingWidget!,
                        ),
                      ),
                      for (Widget e in endingAction) e,
                    ],
                  ),
                  if (titleText != null)
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        titleText!,
                        style: largeSubTitle.copyWith(height: null),
                      ),
                    ),
                ],
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: CustomAnimatedSize(
                child: bottomChild == null
                    ? null
                    : Column(
                        children: [
                          const SizedBox(height: defaultPadding),
                          bottomChild!,
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
