// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/screens_controllers/followers_screen_controller.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({
    super.key,
    // this.endingAction = const [],
    // this.titleText,
    // this.enableBorder = true,
    // this.bottomChild,
    // this.leadingAction = const [],
  });
  // final List<Widget> endingAction;
  // final List<Widget> leadingAction;
  // final Widget? bottomChild;
  // final String? titleText;
  // final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FollowerScreenController>(
      init: FollowerScreenController(),
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            TopBar(
              leadingAction: [
                CustomTopNavbarElevatedButton(),
              ],
              titleText: "Followers (4K)",
            )
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.endingAction = const [],
    this.titleText,
    this.enableBorder = true,
    this.bottomChild,
    this.leadingAction = const [],
    this.dummy,
  });

  final List<Widget> endingAction;
  final List<Widget> leadingAction;
  final Widget? bottomChild;
  final String? titleText;
  final bool? dummy;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      enableBorder: enableBorder,
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Stack(
              children: [
                Row(
                  children: leadingAction,
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
                  children: endingAction,
                )
              ],
            ),
          ),
          if (bottomChild != null) SizedBox(height: defaultPadding),
          if (bottomChild != null) bottomChild!,
        ],
      ),
    );
  }
}
