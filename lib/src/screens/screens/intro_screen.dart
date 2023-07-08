import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/screens/widgets/custom_animated_size.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';
import 'package:tuple/tuple.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
  final DataController _dataController = Get.find();

  final List<Tuple3> images = [
    const Tuple3('https://images.pexels.com/photos/4262414/pexels-photo-4262414.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', "Let’s connect with each other", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"),
    const Tuple3('https://images.pexels.com/photos/1036804/pexels-photo-1036804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', "Let’s connect with each other", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"),
    const Tuple3('https://images.pexels.com/photos/4262423/pexels-photo-4262423.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', "Let’s connect with each other", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"),
  ];
  final RxInt pageIndex = 0.obs;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) => pageIndex.value = value,
            children: [
              for (Tuple3 t in images)
                Column(
                  children: [
                    Expanded(
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: CustomNetworkImage(url: t.item1),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          children: [
                            Text(t.item2, textAlign: TextAlign.center, style: largeText),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Text(t.item3, textAlign: TextAlign.center, style: mediumSubTitle),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < images.length; i++)
                          CustomAnimatedSize(
                            child: GestureDetector(
                              onTap: () => _pageController.animateToPage(i, duration: const Duration(milliseconds: defaultDuration), curve: Curves.linear),
                              child: Container(
                                margin: const EdgeInsets.all(defaultPadding / 8),
                                decoration: BoxDecoration(
                                  color: i == pageIndex.value ? defaultBlack : defaultBlack.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(defaultPadding),
                                ),
                                height: defaultPadding / 4,
                                width: i == pageIndex.value ? defaultPadding * 2 : defaultPadding / 3,
                              ),
                            ),
                          )
                      ],
                    ),
                    CustomElevatedButton(
                      expanded: true,
                      margin: const EdgeInsets.only(top: defaultPadding),
                      constraints: const BoxConstraints(minHeight: defaultBoxHeight, maxWidth: defaultMaxWidth),
                      onDone: (_) => _dataController.appData.value = _dataController.appData.value.copyWith(showOnBoardScreen: false),
                      child: Text(
                        "Get started",
                        style: mediumTitle.copyWith(color: Theme.of(context).canvasColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
