import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/screens_controllers/notification_screen_controller.dart';

import '../../../component.dart';
import '../widgets/custom_elevated_button_widget.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/network_image.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationScreenController>(
      init: NotificationScreenController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              child: const CircleAvatar(
                                child: CustomRoundedButton(
                                    child: CustomNetworkImage(
                                  url:
                                      "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1688342400&Signature=ObwJBbY6g3Djfzhr4DdiqJ3kX~HDd2iDgAY3fIPyPXO62LR0QeGtt-ZM0i5l102ZyLnZyjbzCu03r1RuNgRwjuD1GFAkbMpyKkwH0Q~LeGUiD5TOV9xiPZ2mOVRLjpCPyawRX6LjIkldCrFKF3jdFcP1flc~5XnciI1W3T6Jtr6L2BpdmchFzEpvBffUyAE2Qgzr5ZSPyOFD6-o0wt~EcoVFGx6YJdUB-WnZOuL9e~7lsIcHqYeVg2GfEL3jxABh4EI7~ZYaWpDMBgjUPRBMQaoyecQydhxF8HyFhQA4tl3bxBIeVfFCCGNdY7wxkYEsP5PM4hhtm9KBcuG6H8UbUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                                )),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search)),
                          ],
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Text("Notification", style: largeSubTitle),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    color: defaultGray.withOpacity(0.5),
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: defaultPadding / 1,
                      right: defaultPadding / 1,
                      top: defaultPadding / 4,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomElevatedButton(
                              backgroundColor: Colors.transparent,
                              child: Text(
                                'Show All',
                                style: mediumText,
                              ),
                            ),
                            const Spacer(),
                            CustomElevatedButton(
                              backgroundColor: Colors.transparent,
                              child: Text(
                                'Make all us read',
                                style: mediumText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: defaultPadding / 1,
                    right: defaultPadding / 1,
                    top: defaultPadding / 4,
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.only(left: 16.0),
                          alignment: Alignment.centerRight,
                          child: const CustomElevatedButton(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: defaultPadding / 0.8),
                            height: double.infinity,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Read',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onDismissed: (direction) {},
                        child: Card(
                          child: ListTile(
                            leading: const CustomRoundedButton(
                                child: CustomNetworkImage(
                                    url:
                                        "https://s3-alpha-sig.figma.com/img/9ffb/c5ae/c9c30c0248c3731569b1f7170833a931?Expires=1687737600&Signature=lCJV-i9fUFSrTE2jNmtuDxIfsl50cseN~r56udOJ6rfubFz~zJC6NcZQOJMngpngMfHTMyj3eB~pzKQV7419SN-IRx2TrAPnd0cWzOJpk44yWPi6degkIXP7weRn8KdwVWKaUxu7NaW2TFXj~Dlsj0dN1c9XCrl~bHLEJRsN5-MPgZukOTWCfpV-VmLIiUONuZvhl0-Kn~~QHxTFLKY1X1yN9b8tqYQHg8UBEQJzidAmSc6cFdXIY8A6D8A-0d96lC5FH8oiHeoAuQaHTJZepzvxI1-F1hgPj75bLJ~dyBagp~AhzuhmgWvqJ9tho3-8oZjeCVsDcpdxznFwokOAOQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                            title: Row(children: [
                              Text(
                                "Aarush Galloway",
                                style: mediumTitle,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Shared your post",
                                style: mediumText,
                              )
                            ]),
                            subtitle: Text(
                              "52 min ago",
                              style: mediumText,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
