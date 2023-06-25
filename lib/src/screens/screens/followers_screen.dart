// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/screens_controllers/followers_screen_controller.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({super.key});

  final String postImage = "https://s3-alpha-sig.figma.com/img/ed5a/f9b2/fc6422bd17bf57a6b69562a7ba69184e?Expires=1687737600&Signature=EGA4hivo-J2IhxA-xGIvDj4UFHacj1fug4ZmUUlJwLP9tZpFqjhzNkZRByRppfIc-eqrfX2nXm5~FqDkXCNAPrxolU8s~kvNXCqWqY0J1akH24uQ3rN5N8aHclwO~TnCsV3e4ErAMRCbATzkPRjJ7qZ9nfzIf5L7CCXwknq7fGuCPlA0i8w6txj9sXwedMwiEfGtvQtyQ4~UiUrPU477v94o~3Q7sMYk13v0JW8I-RXAwjBZKv~grXQjGtDqZ4wGv99jh7v7E-geZKuZpeVI2jkNBV6W2BUhQQGryBtbunwkIzM4lVllPuBEjI2azvdB-uoomz0WTtjjrMj93Mvs4A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final String profileUrl = "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final title = "Morsalin Nur";
  final subTitle = "52 minutes ago";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FollowerScreenController>(
      init: FollowerScreenController(),
      builder: (controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              CustomTopBar(
                leadingAction: [
                  CustomTopNavbarElevatedButton(
                    icon: Icons.arrow_back,
                    onTab: () => Get.back(),
                  ),
                ],
                titleText: "Followers (4K)",
              ),
              Expanded(child: ListView.builder(
                itemBuilder: (context, index) {
                  bool bg = index % 2 == 0;
                  return CustomBox(
                    child: ProfileHeadShortInfo(
                      profileUrl: profileUrl,
                      title: title,
                      subTitle: subTitle,
                      endChild: CustomElevatedButton(
                        border: bg ? Border.all(color: defaultBlack, width: 1, strokeAlign: BorderSide.strokeAlignOutside) : null,
                        borderRadius: BorderRadius.circular(defaultPadding),
                        backgroundColor: bg ? Theme.of(context).cardColor : null,
                        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 4),
                        child: Text(
                          bg ? "Following" : "Follow",
                          style: mediumText.copyWith(color: bg ? defaultBlack : Theme.of(context).cardColor),
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
