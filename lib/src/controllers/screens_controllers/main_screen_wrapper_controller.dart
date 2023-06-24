import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/models/app_classes/screen_model.dart';
import 'package:social_app/src/screens/screens/news_feed_screen.dart';

class MainScreenWrapperController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  List<ScreenModel> pages = [
    ScreenModel(page: const NewsFeedScreen(), label: "News Feed", icons: Icons.home),
    ScreenModel(page: Container(color: Colors.amber), label: "Friends", icons: Icons.person),
    ScreenModel(page: Container(color: Colors.red), label: "Notification", icons: Icons.notifications),
    ScreenModel(page: Container(color: Colors.yellow), label: "Message", icons: Icons.message),
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
