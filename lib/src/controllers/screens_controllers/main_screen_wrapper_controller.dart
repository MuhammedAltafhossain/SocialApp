import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/home_screen_wrapper_controller.dart';
import 'package:social_app/src/screens/screens/home_screen_wrapper.dart';
import 'package:social_app/src/screens/screens/intro_screen.dart';
import 'package:social_app/src/screens/screens/user/auth_screen_wrapper.dart';

class MainScreenWrapperController extends GetxController {
  final DataController _dataController = Get.find();

  final PageController pageController = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool force = true;
  final RxBool isInitApp = false.obs;

  List<Widget> pages = [
    Container(color: defaultWhite, child: const SafeArea(child: Center(child: CircularProgressIndicator(color: primarySwatch)))),
    IntroPage(),
    AuthScreenWrapper(),
    const HomeScreenWrapper(),
  ];

  @override
  void onInit() {
    super.onInit();
    _dataController.initApp().then((_) {
      isInitApp.value = true;
      _movePage();
      // _dataController.appData.value = _dataController.appData.value.copyWith(showOnBoardScreen: true); //! For test
    });

    _dataController.user.listen((_) => _movePage());
    _dataController.appData.listen((_) => _movePage());
  }

  moveToHome() {
    if (_dataController.user.value != null) {
      pageController.animateToPage(
        3,
        duration: const Duration(milliseconds: defaultDuration),
        curve: Curves.linear,
      );
    }
  }

  _movePage() {
    if (isInitApp.value) {
      // when logout
      if (_dataController.user.value == null) {
        // When showOnBoardScreen = true
        if (_dataController.appData.value.showOnBoardScreen) {
          if (kDebugMode) print("(Listener) MainScreenWrapperController: Moving to IntroPage");
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: defaultDuration),
            curve: Curves.linear,
          );
        } else {
          force = false;
          if (kDebugMode) print("(Listener) MainScreenWrapperController: Moving to SignInPage");
          pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: defaultDuration),
            curve: Curves.linear,
          );
        }
      } else {
        if (kDebugMode) print("(Listener) MainScreenWrapperController: Moving to MainScreenWrapper");
        if (force) {
          pageController.animateToPage(
            3,
            duration: const Duration(milliseconds: defaultDuration),
            curve: Curves.linear,
          );
        }
      }
    }
  }
}
