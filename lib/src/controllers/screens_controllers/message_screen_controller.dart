import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/services/functions/create_dummy/dummy_message.dart';
import 'package:social_app/src/controllers/services/functions/time.dart';
import 'package:social_app/src/models/pojo_classes/message_model.dart';

class MessageScreenController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String userId = "1";
  @override
  onInit() {
    super.onInit();
    loadMessage();
  }

  List<MessageModel> messages = [];
  RxBool isLoading = false.obs;
  RxMap<String, RxMap<String, RxList<MessageModel>>> showingMessageMap = RxMap();

  sendMessage() {
    if (textEditingController.text.isEmpty) return;
    //! Send Message

    DateTime dt = DateTime.now();
    String d = DateFormat('dd-MMM-yyyy').format(dt);
    String t = DateFormat('hh:mm a').format(adjustMinutesToNextMultipleOfFive(dt));

    //! ---------------------------------------------- Dummy
    if (showingMessageMap.containsKey(d)) {
      if (showingMessageMap[d]!.containsKey(t)) {
        showingMessageMap[d]![t]!.add(MessageModel(
          userId: "1",
          messageTime: dt,
          message: textEditingController.text,
        ));
      } else {
        showingMessageMap[d]![t] = [
          MessageModel(
            userId: "1",
            messageTime: dt,
            message: textEditingController.text,
          )
        ].obs;
      }
    } else {
      showingMessageMap[d] = {
        t: [
          MessageModel(
            userId: "1",
            messageTime: dt,
            message: textEditingController.text,
          )
        ].obs,
      }.obs;
    }
    update();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (_) => scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: defaultDuration),
        curve: Curves.linear,
      ),
    );

    textEditingController.clear();
  }

  loadMessage() async {
    isLoading.value = true;
    // messages = await createDummyMessage();
    messageSimulate().listen((event) {
      createDummy(event);
    });

    // messages = await createDummyMessage();
    // convertTimeSpanMap();
    // isLoading.value = false;
  }

  createDummy(MessageModel event) {
    messages.add(event);
    convertTimeSpanMap();
    isLoading.value = false;
  }

  convertTimeSpanMap() {
    // print(DateTime.now().minute);
    messages.sort((a, b) => a.messageTime.compareTo(b.messageTime));
    for (var element in messages) {
      String d = DateFormat('dd-MMM-yyyy').format(element.messageTime);
      String t = DateFormat('hh:mm a').format(adjustMinutesToNextMultipleOfFive(element.messageTime));
      if (showingMessageMap.containsKey(d)) {
        if (showingMessageMap[d]!.containsKey(t)) {
          showingMessageMap[d]![t]!.add(element);
        } else {
          showingMessageMap[d]![t] = [
            element
          ].obs;
        }
      } else {
        showingMessageMap[d] = {
          t: [
            element
          ].obs,
        }.obs;
      }
    }
  }
}
