// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/message/message_list_screen_controller.dart';
import 'package:social_app/src/screens/screens/message/chat_page.dart';
import 'package:social_app/src/screens/screens/message/message_screen.dart';
import 'package:social_app/src/screens/screens/message/users.dart';
import 'package:social_app/src/screens/screens/message/utils.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/custom_text_field_widget.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class MessageListScreen extends StatelessWidget {
  MessageListScreen({super.key});

  final DataController dataController = Get.find();

  final String profileUrl2 = "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  final title = "Morsalin Nur";

  final RxBool showSearchBar = false.obs;

  Widget _buildAvatar(types.Room room) {
    var color = Colors.transparent;

    if (room.type == types.RoomType.direct) {
      try {
        final otherUser = room.users.firstWhere(
          (u) => u.id != FirebaseAuth.instance.currentUser!.uid,
        );

        color = getUserAvatarNameColor(otherUser);
      } catch (e) {
        // Do nothing if other user is not found.
      }
    }
    final hasImage = room.imageUrl != null;
    final name = room.name ?? '';

    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundColor: hasImage ? Colors.transparent : color,
        backgroundImage: hasImage ? NetworkImage(room.imageUrl!) : null,
        radius: 20,
        child: !hasImage
            ? Text(
                name.isEmpty ? '' : name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageListScreenController>(
        init: MessageListScreenController(),
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: FirebaseAuth.instance.currentUser == null
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const UsersPage(),
                            ),
                          );
                        },
                ),
              ],
              // leading: IconButton(
              //   icon: const Icon(Icons.logout),
              //   // onPressed: FirebaseAuth.instance.currentUser == null ? null : dataController.signOut(),
              // ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              title: const Text('Rooms'),
            ),
            floatingActionButton: CustomRoundedButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).canvasColor,
              ),
            ),
            body: Obx(
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
                    child: StreamBuilder<List<types.Room>>(
                      stream: FirebaseChatCore.instance.rooms(),
                      initialData: const [],
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              bottom: 200,
                            ),
                            child: const Text('No rooms'),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final room = snapshot.data![index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                      room: room,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Row(
                                  children: [
                                    _buildAvatar(room),
                                    Text(room.users.first.id ?? ""),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
