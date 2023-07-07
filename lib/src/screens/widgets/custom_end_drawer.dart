import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/home_screen_wrapper_controller.dart';
import 'package:social_app/src/screens/screens/user/profile_screen.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/custom_status_count.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class CustomEndDrawer extends StatelessWidget {
  CustomEndDrawer({super.key});

  final DataController dataController = Get.find();
  final HomeScreenWrapperController homeScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      color: Theme.of(context).canvasColor,
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! Header
            Expanded(
              child: Column(
                children: [
                  CustomTopBar(
                    backgroundColor: Colors.transparent,
                    leadingWidget: ProfileHeadShortInfo(
                      profileUrl: dataController.user.value?.profileUrl ?? "",
                      title: dataController.user.value?.fullName ?? "",
                      subTitle: dataController.user.value?.userName,
                    ),
                    endingAction: [
                      CustomRoundedButton(
                        border: Border.all(width: 2, color: Theme.of(context).shadowColor),
                        hiddenBackgroundGradient: true,
                        onTap: () {
                          homeScreenWrapperController.goBack();
                          Get.to(() => const ProfilePage());
                        },
                        child: const Icon(Icons.arrow_forward_ios_outlined, color: defaultGray),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: defaultPadding / 2),
                        child: Column(
                          children: [
                            //! Status Count
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                              child: Row(
                                children: [
                                  Expanded(child: CustomStatusCounter(count: "572", subTitle: "Post")),
                                  SizedBox(width: defaultPadding / 2),
                                  Expanded(child: CustomStatusCounter(count: "6.3k", subTitle: "Followers")),
                                  SizedBox(width: defaultPadding / 2),
                                  Expanded(child: CustomStatusCounter(count: "2.5k", subTitle: "Following")),
                                ],
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),

                            //! Notification
                            CustomMenuButton(
                              title: "Notification",
                              subTitle: "See your recent activity",
                              statusValue: "35",
                              onTap: () {
                                homeScreenWrapperController.goBack();
                                homeScreenWrapperController.changeIndex(2);
                              },
                            ),

                            //! Friends
                            CustomMenuButton(
                              title: "Friends",
                              subTitle: "Friend list totals",
                              onTap: () {
                                homeScreenWrapperController.goBack();
                                homeScreenWrapperController.changeIndex(1);
                              },
                            ),

                            //! Messages
                            CustomMenuButton(
                              title: "Messages",
                              subTitle: "Message your friends",
                              statusValue: "2",
                              onTap: () {
                                homeScreenWrapperController.goBack();
                                homeScreenWrapperController.changeIndex(3);
                              },
                            ),

                            //! Albums
                            CustomMenuButton(
                              onTap: () {},
                              title: "Albums",
                              subTitle: "Save or post your albums",
                            ),

                            //! Favorites
                            CustomMenuButton(
                              onTap: () {},
                              title: "Favorites",
                              subTitle: "Friends you love",
                            ),

                            //! Privacy Policy
                            CustomMenuButton(
                              onTap: () {},
                              title: "Privacy Policy",
                              subTitle: "Protect your privacy",
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //! Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
              child: Column(
                children: [
                  CustomElevatedButton(
                    constraints: const BoxConstraints(minHeight: defaultBoxHeight),
                    expanded: true,
                    backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
                    border: Border.all(width: 2, color: Theme.of(context).primaryColorLight, strokeAlign: BorderSide.strokeAlignOutside),
                    onDone: (_) => dataController.signOut(),
                    child: Text(
                      "Log out",
                      style: mediumTitle.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMenuButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String? subTitle;
  final String? statusValue;
  const CustomMenuButton({
    super.key,
    this.onTap,
    required this.title,
    this.subTitle,
    this.statusValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      onTap: onTap,
      backgroundColor: Colors.transparent,
      enableBorder: false,
      child: ProfileHeadShortInfo(
        title: title,
        subTitle: subTitle,
        endChild: Row(
          children: [
            if (statusValue != null) CustomCounter(value: statusValue!),
            const SizedBox(width: defaultPadding / 2),
            const Icon(Icons.arrow_forward_ios_outlined, color: defaultGray)
          ],
        ),
      ),
    );
  }
}
