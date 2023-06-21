import 'package:flutter/material.dart';
import '../../../component.dart';
import '../../../Reusable/reusable_btns.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/custom_elevated_button_widget.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                items: [
                  Column(
                    children: [
                      SizedBox(
                          height: height*0.5,
                          width: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(width*0.5,60),bottomLeft: Radius.elliptical(width*0.5, 60)),
                            child: Image.network('https://s3-alpha-sig.figma.com/img/481c/cbfa/52fda731dcb2c37bd4f529455d6d4c24?Expires=1688342400&Signature=B9EwKLL-Clsvs3VzXRIcBU~HPiiKj15fV1loY3sHruMwraoLIxXIYJy1uxF4DFnupb8IwbbyDFnP4aPFIJgg1obVuu8Z9klQxt-yyca9M6PglVBqLuFNCv5XL8tYMgtI74LrqLEe3z5~qTa6atqqwETVSzk2OGshdlqAlFunlSuqykNpZ2qYwzGQJpGRbAHMVFerCowuVkOpzFB3tuNtxY6uMwiOElmIxF9MViY~nH7Rc0DOCrmD87V5ym26RA6i2Ty9ymREwjNT00nrGuzJzojgTrfAXo8Rr4VICbDDlsGc5cqT0dyqEaVwXoJP-dQcPtIWFN81PjmDNTvbpMJ~ig__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',fit: BoxFit.cover,),
                          )
                      ),
                      const SizedBox(height: 15,),
                      Text("Let's connect",style: largeText,),
                      Text("with each other",style: largeText,),
                      Text('Lorem Ispum',style: mediumTitle,),

                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: height*0.5,
                          width: width,
                          child: ClipRRect(

                            borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(width*0.5,60),bottomLeft: Radius.elliptical(width*0.5, 60)),
                            child: Image.network('https://images.pexels.com/photos/11743627/pexels-photo-11743627.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',fit: BoxFit.cover,),
                          )
                      ),
                      const SizedBox(height: 15,),
                      Text("Meet new people",style: largeText,),
                      Text("Make new friends",style: largeText,),
                      Text('Lorem Ispum',style: mediumTitle,),

                    ],
                  ),Column(
                    children: [
                      SizedBox(
                          height: height*0.5,
                          width: width,
                          child: ClipRRect(

                            borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(width*0.5,60),bottomLeft: Radius.elliptical(width*0.5, 60)),
                            child: Image.network('https://images.pexels.com/photos/1036804/pexels-photo-1036804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',fit: BoxFit.cover,),
                          )
                      ),
                      const SizedBox(height: 15,),
                      Text("Let's make",style: largeText,),
                      Text("new friends",style: largeText,),
                      Text('Lorem Ispum',style: mediumTitle,),

                    ],
                  ),
                ],
                options: CarouselOptions(
                  height: height*0.85,
                  aspectRatio: 9/16,
                  viewportFraction: 1,
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
                )
            ),

            // CustomElevatedButton1(width, "Get Started"),
            CustomElevatedButton(
              iconColor: Colors.deepOrange,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 58,
              expanded: true,
              onDone: (isSuccess) {
                print(isSuccess);
              },
              onTap: () async{
                await Future.delayed(Duration(seconds: 2));
                return false;
              },
              child: Text("Get Started",style: mediumTitle.copyWith(color: defaultWhite),),

            )
          ],
        ),
      )

    );
  }
}
