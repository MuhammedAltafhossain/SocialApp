import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/models/app_classes/screen_model.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_end_drawer.dart';
import '../../controllers/screens_controllers/home_screen_wrapper_controller.dart';
import '../widgets/custom_alive.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenWrapperController>(
      init: HomeScreenWrapperController(),
      initState: (state) {},
      builder: (controller) {
        return Obx(
          () => WillPopScope(
            onWillPop: () async => controller.goBack(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              key: controller.mainScreenWrapperController.scaffoldKey,
              endDrawer: CustomEndDrawer(),
              body: PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomAlive(child: controller.pages[index].page);
                },
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: defaultShadowColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < controller.pages.length; i++)
                      Expanded(
                        child: CustomElevatedButton(
                          borderRadius: BorderRadius.zero,
                          height: defaultBoxHeight,
                          backgroundColor: Colors.transparent,
                          onDone: (_) => controller.changeIndex(i),
                          child: FittedBox(
                            child: Column(
                              children: [
                                Icon(
                                  controller.pages[i].icons,
                                  color: controller.selectedIndex.value == i ? Theme.of(context).primaryColor : defaultBlack,
                                ),
                                if (controller.pages[i].label?.isNotEmpty ?? false)
                                  Text(
                                    controller.pages[i].label!,
                                    style: mediumText.copyWith(
                                      color: controller.selectedIndex.value == i ? Theme.of(context).primaryColor : defaultBlack,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
