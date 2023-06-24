import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/screens_controllers/comment_screen_controller.dart';
import 'package:social_app/src/screens/screens/followers_screen.dart';
import 'package:social_app/src/screens/widgets/custom_animated_size.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';
import 'package:social_app/src/screens/widgets/profile_head_short_info.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  final int totalItem = 10;

  final String postImage = "https://s3-alpha-sig.figma.com/img/ed5a/f9b2/fc6422bd17bf57a6b69562a7ba69184e?Expires=1687737600&Signature=EGA4hivo-J2IhxA-xGIvDj4UFHacj1fug4ZmUUlJwLP9tZpFqjhzNkZRByRppfIc-eqrfX2nXm5~FqDkXCNAPrxolU8s~kvNXCqWqY0J1akH24uQ3rN5N8aHclwO~TnCsV3e4ErAMRCbATzkPRjJ7qZ9nfzIf5L7CCXwknq7fGuCPlA0i8w6txj9sXwedMwiEfGtvQtyQ4~UiUrPU477v94o~3Q7sMYk13v0JW8I-RXAwjBZKv~grXQjGtDqZ4wGv99jh7v7E-geZKuZpeVI2jkNBV6W2BUhQQGryBtbunwkIzM4lVllPuBEjI2azvdB-uoomz0WTtjjrMj93Mvs4A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final String profileUrl = "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  final title = "Morsalin Nur";
  final subTitle = "52 minutes ago";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentScreenController>(
      init: CommentScreenController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Stack(
            children: [
              //! Comments
              ListView.builder(
                controller: controller.scrollController,
                itemCount: totalItem + 2,
                itemBuilder: (context, index) {
                  //! Posted Image
                  if (index == 0) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: CustomNetworkImage(
                            url: postImage,
                          ),
                        ),
                        //! Share, like & comment status
                        Positioned(
                            left: defaultPadding / 2,
                            right: defaultPadding - defaultPadding / 4,
                            bottom: defaultPadding / 4,
                            child: Row(
                              children: [
                                CustomElevatedButton(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                  backgroundColor: Colors.transparent,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share_rounded,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      const SizedBox(width: defaultPadding / 3),
                                      Text(
                                        "8",
                                        style: mediumText.copyWith(color: Theme.of(context).canvasColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                CustomElevatedButton(
                                  backgroundColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_outline,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      const SizedBox(width: defaultPadding / 3),
                                      Text(
                                        "8",
                                        style: mediumText.copyWith(color: Theme.of(context).canvasColor),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomElevatedButton(
                                  backgroundColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.messenger_outline_outlined,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      const SizedBox(width: defaultPadding / 3),
                                      Text(
                                        "8",
                                        style: mediumText.copyWith(color: Theme.of(context).canvasColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    );
                  }
                  //! Post
                  else if (index == 1) {
                    return CustomBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //! Profile Image & Info
                          ProfileHeadShortInfo(
                            profileUrl: profileUrl,
                            title: title,
                            subTitle: subTitle,
                          ),
                          const SizedBox(height: defaultPadding),
                          Text(
                            "Lorem isum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: mediumText,
                          )
                        ],
                      ),
                    );
                  }
                  return CommentScreenCommentListTile();
                },
              ),
              // ! Back
              Positioned(
                // top: defaultPadding,
                left: 0,
                right: 0,
                child: Obx(
                  () => CustomTopBar(
                    enableBorder: false,
                    backgroundOpacity: controller.navbarOpacity.value,
                    leadingAction: [
                      CustomTopNavbarElevatedButton(
                        hiddenBackground: controller.navbarOpacity.value < 0.5 ? true : false,
                        icon: Icons.arrow_back,
                      )
                    ],
                    leadingWidget: CustomAnimatedSize(
                      child: controller.navbarOpacity.value < 0.5
                          ? null
                          : ProfileHeadShortInfo(
                              profileUrl: profileUrl,
                              title: title,
                              subTitle: subTitle,
                            ),
                    ),
                    endingAction: [
                      CustomRoundedButton(
                        hiddenBackground: true,
                        onTap: () => Get.to(const FollowerScreen()),
                        child: Icon(
                          Icons.more_vert_outlined,
                          color: controller.navbarOpacity.value < 0.5 ? Theme.of(context).canvasColor : defaultBlack,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentScreenCommentListTile extends StatelessWidget {
  final Widget? child;
  CommentScreenCommentListTile({super.key, this.child});

  final RxBool isLiked = false.obs;
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomBox(
        onTap: () => isExpanded.value = !isExpanded.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Profile Image & Info & Like Button
            ProfileHeadShortInfo(
              profileUrl: "https://s3-alpha-sig.figma.com/img/e1c8/d586/c7ccc1b11d6ad688c0fb7742756c5db6?Expires=1687737600&Signature=nwRoWX3pfivFRk3Ab756m-FQ-Xi5YPGwxPGN4ckAVkOGgfeeIsf0H6MTqBXdDPzQX6yUQTktgLydI4TsnolOyWoUDnDApjWDfV-O5au1vbhd8rR9zdPh5IVt9t3~WzsZddYXjKy8XXURgx7d9LyL6OYBCiqjnFxCxpppcUEzPPEs4Vsd3F0vGaGaS~Y5NvPfrEieIZwp71IsRQiaEeKuNjh5psmDQnjJEE769GSPm1gjTzzi-WS~41fcznApeU-i-akiCm7UZVk7KuxSjTOZpavC5J0rTFNnY6UzUuaP8xFY9iE6KjZMxi9S23wK51v-swbPUMkd~f4KSOBqOLTlog__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
              title: "Morsalin Nur",
              subTitle: "52 minutes ago",
              endChild: CustomRoundedButton(
                onTap: () {
                  isLiked.value = !isLiked.value;
                },
                backgroundColor: Colors.transparent,
                child: Icon(
                  isLiked.value ? Icons.favorite : Icons.favorite_border,
                  color: isLiked.value ? Theme.of(context).colorScheme.error : Theme.of(context).shadowColor,
                ),
              ),
            ),
            SizedBox(height: defaultPadding.h),
            CustomAnimatedSize(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(right: (defaultPadding / 2).w),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                  maxLines: isExpanded.value ? null : 2,
                  overflow: isExpanded.value ? TextOverflow.clip : TextOverflow.ellipsis,
                  style: mediumText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
