import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/screens_controllers/message/message_list_screen_controller.dart';
import 'package:social_app/src/screens/screens/message/message_screen.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  final String profileUrl2 = "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  // final title = "Morsalin Nur";
  final subTitle = "Hello";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageListScreenController>(
        init: MessageListScreenController(),
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text("Message")),
            floatingActionButton: CustomRoundedButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
            ),
            body: Obx(() => ListView.builder(
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
                )),
          );
        });
  }
}
