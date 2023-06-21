import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  //navigation
  void changeIndex(int index) {
    if (index == 2 || index == 3) {}
    selectedIndex = index;
    update();
  }
}
