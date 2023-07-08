import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/component.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

import '../widgets/custom_top_navbar_elevated_button.dart';
import '../widgets/profile_head_short_info.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({Key? key}) : super(key: key);

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(children: [
        CustomTopBar(
          leadingAction: [
            CustomTopNavbarElevatedButton(
              icon: Icons.arrow_back,
              onTab: () => Get.back(),
            )
          ],
        ),
        SizedBox(
          height: height * 0.3,
        ),
        const Padding(
          padding: EdgeInsets.all(30),
          child: CustomElevatedButton(
            height: 45,
            width: double.infinity,
            child: Text(
              'Upload a photo',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ]),
    )));
  }
}
