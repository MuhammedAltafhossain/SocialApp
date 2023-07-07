import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/screens_controllers/main_screen_wrapper_controller.dart';

class MainScreenWrapper extends StatefulWidget {
  const MainScreenWrapper({super.key});

  @override
  State<MainScreenWrapper> createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  final MainScreenWrapperController controller = Get.put(MainScreenWrapperController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenWrapperController>(
        init: MainScreenWrapperController(),
        initState: (state) {},
        builder: (controller) {
          return PageView(
            controller: controller.pageController,
            onPageChanged: (value) {
              FocusScope.of(context).unfocus();
              controller.scaffoldKey.currentState?.closeEndDrawer();
            },
            physics: const NeverScrollableScrollPhysics(),
            children: controller.pages,
          );
        });
  }
}
