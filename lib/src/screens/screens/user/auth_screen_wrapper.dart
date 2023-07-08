import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/auth_screen_wrapper_controller.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';

class AuthScreenWrapper extends StatelessWidget {
  AuthScreenWrapper({super.key});

  final AuthScreenWrapperController _controller = Get.put(AuthScreenWrapperController());
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            controller: _controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => FocusScope.of(context).unfocus(),
            children: _controller.pages,
          ),
          CustomBox(
            enableBorder: false,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.only(left: defaultPadding, top: defaultPadding),
            child: CustomTopNavbarElevatedButton(
              icon: Icons.arrow_back,
              onTab: () => dataController.appData.value = dataController.appData.value.copyWith(showOnBoardScreen: true),
            ),
          ),
        ],
      ),
    );
  }
}
