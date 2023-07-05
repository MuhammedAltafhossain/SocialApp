import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxDouble navbarOpacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
  }

  _scrollListener() {
    double navOpacity = scrollController.offset / 200;
    if (navOpacity < 1) navbarOpacity.value = navOpacity;
    // update();
    // print(scrollController.position);
  }
}
