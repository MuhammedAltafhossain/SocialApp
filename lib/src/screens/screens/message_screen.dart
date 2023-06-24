import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/models/pojo_classes/message_model.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/screens_controllers/message_screen_controller.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_message_tile.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/custom_text_field_widget.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  final String profileUrl1 = "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final String profileUrl2 = "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  final title = "Morsalin Nur";
  final subTitle = "Active";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageScreenController>(
      init: MessageScreenController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //! App Bar
                  CustomTopBar(
                    leadingAction: [
                      CustomTopNavbarElevatedButton(
                        icon: Icons.arrow_back,
                        onTab: () => Get.back(),
                      )
                    ],
                    leadingWidget: ProfileHeadShortInfo(
                      isActive: true,
                      profileUrl: profileUrl2,
                      title: title,
                      subTitle: subTitle,
                    ),
                    endingAction: [
                      //! Call Button
                      CustomRoundedButton(
                        boxShadow: defaultBoxShadowDown
                            .map(
                              (e) => BoxShadow(
                                color: Theme.of(context).primaryColorLight,
                                blurRadius: e.blurRadius,
                                blurStyle: e.blurStyle,
                                offset: e.offset,
                                spreadRadius: e.spreadRadius,
                              ),
                            )
                            .toList(),
                        hiddenBackgroundGradient: true,
                        backgroundColor: const Color(0XFFE8FDED),
                        child: Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  //! Message History
                  Expanded(
                    child: Scaffold(
                      body: ListView.builder(
                        reverse: true,
                        controller: controller.scrollController,
                        itemCount: controller.showingMessageMap.length,
                        itemBuilder: (context, index) {
                          String date = controller.showingMessageMap.keys.elementAt(index);
                          Map<String, List<MessageModel>> messages = controller.showingMessageMap.values.elementAt(index);
                          return Obx(
                            () => StickyHeader(
                              header: Container(
                                padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                                alignment: Alignment.center,
                                color: Theme.of(context).canvasColor,
                                child: Text(
                                  date,
                                  style: smallTitle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: messages.entries
                                    .map(
                                      (e) => StickyHeader(
                                        header: Container(
                                          padding: const EdgeInsets.only(top: defaultPadding / 2),
                                          color: Theme.of(context).canvasColor,
                                          alignment: Alignment.center,
                                          child: Text(e.key, style: mediumText, textAlign: TextAlign.center),
                                        ),
                                        content: MessageOnADay(messages: e.value, mainUserId: "1"),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  //! Write Message
                  CustomBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            textEditingController: controller.textEditingController,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(defaultPadding / 3),
                              borderSide: const BorderSide(color: defaultGray),
                            ),
                            onComplete: (value) => controller.sendMessage(),
                            hintText: "Say something",
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding / 2,
                        ),
                        //! Send Button
                        CustomRoundedButton(
                          boxShadow: defaultBoxShadowDown,
                          onTap: () => controller.sendMessage(),
                          child: Transform.rotate(
                            angle: 1.75 * 3.1426,
                            child: Icon(
                              Icons.send_outlined,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MessageOnADay extends StatelessWidget {
  final List<MessageModel> messages;
  final String mainUserId;
  const MessageOnADay({super.key, required this.messages, required this.mainUserId});

  final String profileUrl1 = "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final String profileUrl2 = "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      String runningList = "";

      return Obx(
        () => Column(
          children: [
            for (MessageModel m in messages)
              Builder(
                builder: (_) {
                  bool isA = m.userId == mainUserId;
                  bool isSameList = runningList.isEmpty ? false : runningList == m.userId;
                  Widget child = Container(
                    margin: EdgeInsets.only(
                      top: isSameList ? 0 : defaultPadding / 2,
                      left: isA ? defaultPadding : 0,
                      right: !isA ? defaultPadding : 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                    child: Builder(
                      builder: (_) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: isA ? MainAxisAlignment.end : MainAxisAlignment.start,
                          children: [
                            !isSameList
                                ? !isA
                                    ? Padding(
                                        padding: const EdgeInsets.only(left: defaultPadding / 2),
                                        child: CustomRoundedButton(
                                          size: 38,
                                          child: CustomNetworkImage(url: profileUrl2),
                                        ),
                                      )
                                    : const SizedBox()
                                : !isA
                                    ? const SizedBox(
                                        width: 38 + defaultPadding / 2,
                                      )
                                    : const SizedBox(),
                            Flexible(
                              child: CustomBox(
                                constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
                                margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                padding: const EdgeInsets.all(defaultPadding / 2),
                                backgroundColor: isA
                                    ? m.message.trim().isEmpty
                                        ? defaultGray.withOpacity(0.2)
                                        : Theme.of(context).primaryColor
                                    : m.message.trim().isEmpty
                                        ? defaultGray.withOpacity(0.2)
                                        : null,
                                borderRadius: BorderRadius.only(
                                  topLeft: isA ? const Radius.circular(defaultPadding / 2) : Radius.zero,
                                  topRight: !isA ? const Radius.circular(defaultPadding / 2) : Radius.zero,
                                  bottomLeft: const Radius.circular(defaultPadding / 2),
                                  bottomRight: const Radius.circular(defaultPadding / 2),
                                ),
                                child: Text(
                                  m.message.trim().isEmpty ? "Message has been deleted." : m.message,
                                  style: smallTitle.copyWith(
                                    color: isA
                                        ? m.message.trim().isEmpty
                                            ? defaultGray
                                            : Theme.of(context).cardColor
                                        : m.message.trim().isEmpty
                                            ? defaultGray
                                            : defaultBlack,
                                  ),
                                ),
                              ),
                            ),
                            !isSameList
                                ? isA
                                    ? Padding(
                                        padding: const EdgeInsets.only(right: defaultPadding / 2),
                                        child: CustomRoundedButton(
                                          size: 38,
                                          child: CustomNetworkImage(url: profileUrl1),
                                        ),
                                      )
                                    : const SizedBox()
                                : isA
                                    ? const SizedBox(
                                        width: 38 + defaultPadding / 2,
                                      )
                                    : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  );
                  runningList = m.userId;
                  return child;
                },
              ),
          ],
        ),
      );
    });
  }
}
