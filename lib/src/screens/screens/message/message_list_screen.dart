// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/message/message_list_screen_controller.dart';
import 'package:social_app/src/screens/screens/message/message_screen.dart';
import 'package:social_app/src/screens/widgets/custom_animated_size.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/custom_text_field_widget.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class MessageListScreen extends StatelessWidget {
  MessageListScreen({super.key});

  final DataController dataController = Get.find();

  final String profileUrl2 = "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  final title = "Morsalin Nur";

  final RxBool showSearchBar = false.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageListScreenController>(
        init: MessageListScreenController(),
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
            floatingActionButton: CustomRoundedButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
            ),
            body: SafeArea(
              child: Obx(
                () => Column(
                  children: [
                    CustomTopBar(
                      leadingWidget: ProfileHeadShortInfo(
                        isActive: true,
                        profileUrl: dataController.user.value?.profileUrl,
                        title: dataController.user.value?.fullName ?? "",
                        subTitle: dataController.user.value?.userName,
                      ),
                      endingAction: [
                        CustomRoundedButton(
                          backgroundColor: Colors.transparent,
                          onTap: () => showSearchBar.value = !showSearchBar.value,
                          child: const Icon(Icons.search),
                        ),
                        CustomRoundedButton(
                          onTap: () {},
                          backgroundColor: Colors.transparent,
                          child: const Icon(Icons.more_vert_outlined),
                        )
                      ],
                      bottomChild: !showSearchBar.value ? null : CustomTextFormField(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.messageList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == controller.messageList.length) return const SizedBox(height: 2 * defaultBoxHeight);
                          return CustomBox(
                            onTap: () {
                              Get.to(() => MessageScreen(messageId: controller.messageList.elementAt(index)));
                            },
                            child: ProfileHeadShortInfo(
                              profileUrl: profileUrl2,
                              title: controller.messageList.elementAt(index),
                              subTitle: subTitle,
                              endChild: const Icon(Icons.arrow_right),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
