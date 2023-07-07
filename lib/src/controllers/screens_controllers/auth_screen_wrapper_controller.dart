import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/screens/screens/user/signin_screen.dart';
import 'package:social_app/src/screens/screens/user/signup_screen.dart';

class AuthScreenWrapperController extends GetxController {
  PageController pageController = PageController();

  List<Widget> pages = [
    const SignInPage(),
    const SignUpPage()
  ];
}
