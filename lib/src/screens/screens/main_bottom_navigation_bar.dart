import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/screens/screens/news_feed_screen.dart';

import '../../controllers/screens_controllers/bottom_navigation_controller.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  BottomNavigationController controller = Get.put(BottomNavigationController());

  final List<Widget> screen = const [
    NewsFeedScreen(),
    NewsFeedScreen(),
    NewsFeedScreen(),
    NewsFeedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (_) {
          return screen[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Friends'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Messages'),
          ],
        );
      }),
    );
  }
}
