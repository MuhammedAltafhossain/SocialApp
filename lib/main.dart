import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/screens/message/message_list_screen.dart';
import 'package:social_app/src/screens/screens/message/message_screen.dart';

import 'src/screens/screens/comment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        initialBinding: InitializedBinding(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        theme: ThemeData(
          primarySwatch: primarySwatch,
          cardColor: defaultWhite,
          shadowColor: defaultShadowColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            background: defaultWhite,
          ),
        ),
        home: const MessageListScreen(),
      ),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {}
}
