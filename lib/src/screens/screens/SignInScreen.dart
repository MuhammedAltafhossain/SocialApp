import 'package:flutter/material.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import '../../../component.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.13,
            ),
            Text(
              'Hello Again!',
              style: largeText,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sign in to your account',
              style: mediumSubTitle,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      style: mediumTitle,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                        label: Text('Email Address', style: TextStyle(color: Colors.greenAccent)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Enter your password', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot your password?',
                      style: mediumTitle.copyWith(color: Colors.greenAccent),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    iconColor: Colors.deepOrange,
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    height: 58,
                    expanded: true,
                    onDone: (isSuccess) {
                      print(isSuccess);
                    },
                    onTap: () async {
                      await Future.delayed(Duration(seconds: 2));
                      return false;
                    },
                    child: Text(
                      "Sign In",
                      style: mediumTitle.copyWith(color: defaultWhite),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          indent: 0,
                          endIndent: 10.0,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        'Or With',
                        style: mediumSubTitle,
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 0,
                          endIndent: 10.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                      border: Border.all(width: 1, color: defaultGray, strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      backgroundColor: Colors.white,
                      iconColor: Colors.deepOrange,
                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      height: 58,
                      expanded: true,
                      onDone: (isSuccess) {
                        print(isSuccess);
                      },
                      onTap: () async {
                        await Future.delayed(Duration(seconds: 2));
                        return false;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'G',
                            style: mediumText.copyWith(color: defaultBlack, fontSize: 22),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in with Google',
                            style: largeSubTitle,
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? Let's ",
                        style: mediumTitle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
                          style: mediumTitle.copyWith(color: Colors.greenAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
