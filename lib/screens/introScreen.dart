import 'package:flutter/material.dart';
import '../component.dart';
import '../Reusable/reusable_btns.dart';
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
      body: Column(
        children: [
          Container(
            height: height*0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(width*0.5,60),bottomLeft: Radius.elliptical(width*0.5, 60)),
              child: Image.asset('images/introPic1.jpg',fit: BoxFit.fitHeight,),
            )
          ),
          SizedBox(height: 30,),
          Text("Let's connect",style: largeText,),
          Text("with each other",style: largeText,),
          Text('Lorem Ispum',style: mediumTitle,),
          SizedBox(height: 20,),
          CustomElevatedButton1(width, "Get Started"),
        ],
      ),

    );
  }
}
