import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/screens_controllers/followers_screen_controller.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FollowerScreenController>(
      init: FollowerScreenController(),
      builder: (controller) => Scaffold(),
    );
  }
}
