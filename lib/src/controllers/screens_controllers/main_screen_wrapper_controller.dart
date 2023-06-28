import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/models/app_classes/screen_model.dart';
import 'package:social_app/src/screens/screens/followers_screen.dart';
import 'package:social_app/src/screens/screens/message_screen.dart';
import 'package:social_app/src/screens/screens/news_feed_screen.dart';

import '../../screens/screens/notification_screen_design.dart';

class MainScreenWrapperController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  List<ScreenModel> pages = [
    ScreenModel(
        page: const NewsFeedScreen(), label: "News Feed", icons: Icons.home),
    ScreenModel(
        page: const FollowerScreen(), label: "Friends", icons: Icons.person),
    ScreenModel(
        page: const NotificationScreen(),
        label: "Notification",
        icons: Icons.notifications),
    ScreenModel(
        page: const MessageScreen(), label: "Message", icons: Icons.message),
  ];

  //navigation
  void changeIndex(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(selectedIndex.value, duration: const Duration(milliseconds: defaultDuration), curve: Curves.linear);
  }

  bool goBack() {
    if (selectedIndex.value == 0) return true;

    changeIndex(0);
    return false;
  }
}