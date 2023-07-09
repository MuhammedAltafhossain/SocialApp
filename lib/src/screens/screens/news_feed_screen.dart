import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/screens_controllers/news_feed_screen_controller.dart';
import 'package:social_app/src/screens/screens/comment_screen.dart';
import 'package:social_app/src/screens/widgets/custom_top_bar.dart';

import '../../../component.dart';
import '../widgets/custom_elevated_button_widget.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/network_image.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsFeedScreenController>(
      init: NewsFeedScreenController(),
      initState: (state) {},
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            CustomTopBar(
              leadingAction: [
                CustomRoundedButton(
                  backgroundColor: Colors.transparent,
                  onTap: () {},
                  child: const Icon(Icons.camera_alt),
                )
              ],
              endingAction: [
                CustomRoundedButton(
                  backgroundColor: Colors.transparent,
                  onTap: () {},
                  child: const Icon(Icons.search),
                )
              ],
              bottomChild: Align(alignment: Alignment.centerLeft, child: Text("Timeline", style: largeSubTitle)),
            ),
            //header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: const BorderDirectional(bottom: BorderSide(color: defaultShadowColor, width: 1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Profile Image & Info
                  Row(
                    children: [
                      const CustomRoundedButton(child: CustomNetworkImage(url: "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                      const SizedBox(width: defaultPadding / 1.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Morsalin Nur", style: mediumTitle),
                          const SizedBox(height: defaultPadding / 8),
                          Text("52 minutes ago", style: mediumText.copyWith(height: 1)),
                        ],
                      ),
                      const Spacer(),
                      const CustomElevatedButton(
                        constraints: null,
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Text(
                          'Follow',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 271,
                    width: double.infinity,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: const CustomNetworkImage(
                          url: 'https://images.pexels.com/photos/122107/pexels-photo-122107.jpeg?auto=compress&cs=tinysrgb&w=1600',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      //shear
                      CustomElevatedButton(
                        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                        backgroundColor: Colors.transparent,
                        height: 45,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.share_rounded,
                              color: defaultBlack,
                            ),
                            const SizedBox(width: defaultPadding / 3),
                            Text(
                              "8",
                              style: mediumText.copyWith(color: defaultBlack),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      //like
                      CustomElevatedButton(
                        backgroundColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                        height: 45,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite_outline,
                              color: defaultBlack,
                            ),
                            const SizedBox(width: defaultPadding / 3),
                            Text(
                              "8",
                              style: mediumText.copyWith(color: defaultBlack),
                            ),
                          ],
                        ),
                      ),
                      //comment
                      CustomElevatedButton(
                        backgroundColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                        height: 45,
                        onDone: (_) {
                          Get.to(const CommentScreen());
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.messenger_outline_outlined,
                              color: defaultBlack,
                            ),
                            const SizedBox(width: defaultPadding / 3),
                            Text(
                              "8",
                              style: mediumText.copyWith(color: defaultBlack),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )

            //News Card
          ],
        ),
      ),
    );
  }
}
