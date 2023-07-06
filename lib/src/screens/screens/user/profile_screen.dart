import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: defaultWhite,
        foregroundColor: defaultBlack,
        title: Text(
          "Profile",
          style: largeSubTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    border: Border.all(width: 2, color: Colors.greenAccent)),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/6f58/889e/64b267f6681d45b9405519103ab2ad99?Expires=1688342400&Signature=bmkvK~~CcpoyMxbUUtMO~ulZrGbxh98fJkZxSpKI2qymyPmSsQFsEMko-Ptnx2pOzjUOdf1jz7wds5ve3aEQ~jc0cTcNXvRLjZHGz3Qj7nPLWj4Ms4zM3nGwD0gESb6WCbeflSkpXlrWbVAasj2uCvEzDOTmCPfmZpztvPiA-rZe2lo5W3-Zbi2wtT8Ypw02-QP93V0VbZ59D3H0ao253G4SP-O5FrONXv-iQ6RJqeCnCeYzZGrVlp8bI5ApdRIwzAe6PSS5Nw5FsyGesY1QuO~zeuCWqkfcNswfecWGcx4ttIbmSsrlYwZWAGWnWBOVll2lIk7ck-wDY9lI7S8Wrg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tom Cruise",
              style: largeSubTitle,
            ),
            Text(
              "@tomcruise",
              style: mediumSubTitle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customStylishContainer(),
                customStylishContainer(),
                customStylishContainer(),
                customStylishContainer()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: defaultPadding / 4,
                      horizontal: defaultPadding / 2),
                  borderRadius: BorderRadius.circular(defaultPadding),
                  backgroundColor: Colors.transparent,
                  border: Border.all(
                      width: 1,
                      color: Colors.grey,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.greenAccent,
                        size: 15,
                      ),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      const Icon(
                        Icons.message_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      Text(
                        'Message',
                        style: mediumTitle.copyWith(color: defaultBlack),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                CustomElevatedButton(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 2.4,
                      horizontal: defaultPadding),
                  borderRadius: BorderRadius.circular(defaultPadding),
                  child: Text(
                    'Follow',
                    style: smallTitle.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 1, color: Colors.black12)),
                  width: width * 0.3,
                  child: Column(
                    children: [
                      Text(
                        '6.3k',
                        style: followerCount,
                      ),
                      Text(
                        'Followers',
                        style: mediumTitle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 1, color: Colors.black12)),
                  width: width * 0.3,
                  child: Column(
                    children: [
                      Text(
                        '572',
                        style: followerCount,
                      ),
                      Text(
                        'Post',
                        style: mediumTitle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(width: 1, color: Colors.black12)),
                  width: width * 0.3,
                  child: Column(
                    children: [
                      Text(
                        '2.5k',
                        style: followerCount,
                      ),
                      Text(
                        'Following',
                        style: mediumTitle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
                items: [
                  customPictureContainer(height, width,
                      'https://s3-alpha-sig.figma.com/img/6c77/c78f/ab99510d7c798e9182966b47f996f8eb?Expires=1688342400&Signature=iGxJ27k1AKTpODYq3kT3ZIwVD3nypf9y~Kkbn6hxNr7SFAvmoCM~L8Gwvcnh1G7RCSpPjsyzX2RxO4G3ctAWISJTe6Fgk80p4J0Q3JWsLtepTPmslTn8yUbEunRmfTNoT7rvk2D3wxwXAzL6VItzueCFlci0rkS0NT4GL32xBdnY3qgwoAoXza29OJstPmJC~XtvCLbcezzDzPe~3Ui2GpS98TeOMP3R2yu-0e9~m1NKeddnB6PkJ-VAQBRAQLaFzat7YtijG~TC67OTR6tlk-mV3fjU~kj9hA4Z4RLAYfyOp7wKIvG79GxhfmaywecCpsE68Kf-av7B0Ju6gmlnhw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                  customPictureContainer(height, width,
                      'https://s3-alpha-sig.figma.com/img/9548/9887/8c164225ed77ca2e2b96a490ded58a9c?Expires=1688342400&Signature=jBL9HyoYvPGKKQnKSIm1iRga5VHqkKIXibDaOORw5rvRaFudgOc7z2h9D0Tt6zDVfkewODCa8UJ878e5PYn7t0eBECpaQhXK1FcP~ku2h1lgppsLi36GEmwuMcC8q7v8QGLBx3JxnS1~ZOPjwIWqBSH~Nt9uZOpuoCoc0YOtd-uLhd~Lsp3-xA6LpCeLCB~e7otSqOsBLy7B0DKBWpkJFd2z6xU-x8wpifg77fw06MopeW4-WpAxISAMOI9vIeU97Yeg1TGgtPjI6G9c~nvREaYnqIawlTpSWexD7TpPlG~5koYocWlC0-4Wjz68L0ERKZiQ6SaLzPXpROCwsOWQIg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                  customPictureContainer(height, width,
                      'https://s3-alpha-sig.figma.com/img/a94b/08df/71a2df67ce174c0bc34a8eabbb9759ca?Expires=1688342400&Signature=fxnjXVdDqFWf-vh93lE4GwISjn3a1sWHLJK~414YFe9~BZMAqGokdio8QStGvqH3BAXv-uHG9XEvoiLHdysxyn9jMt-SztxwCyYCzy~2FiQiFJmKtm1klLyL~5l0YeC7kOIo6lxlItc81wHeJqNeLQ1vgOMWaYBK4dAcIUqBJ6tJQudWl5vESbd5oQntm7diGIjR8BgKhv16TttNuZFWnqXFVruhcq~5TAbkOB0jLLr1tKpAGpg780XXyp4w7AzkmGCcGaFGcOvXnc9MRKarLSVGR4BFCMCVeEF7y44jPS~mwkEmOiFR2x1QRvP~Gqdfm-QiiuWS84n5l8R9cMQI3A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                ],
                options: CarouselOptions(
                  height: height * 0.25,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ))
          ],
        ),
      ),
    );
  }
}

Padding customStylishContainer() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      // color: Colors.black12,
      padding: const EdgeInsets.all(6),
      child: const CircleAvatar(
        radius: 13,
        backgroundColor: Colors.grey,
      ),
    ),
  );
}

SizedBox customPictureContainer(height, width, imageUrl) {
  return SizedBox(
      height: height * 0.4,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ));
}
