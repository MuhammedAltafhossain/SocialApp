// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/screens/user/signup_screen.dart';
import 'package:social_app/src/screens/widgets/auth_text_form_field.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_text_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: defaultMaxWidth),
              padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
              child: Column(
                children: [
                  //! Title
                  Text("Hello Again!", style: largeTitle),
                  SizedBox(height: defaultPadding / 4),

                  //! Subtitle
                  Text("Sign in to your account", style: mediumSubTitle),
                  SizedBox(height: defaultPadding * 2),

                  //! Email input field
                  AuthTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email address',
                  ),
                  SizedBox(height: defaultPadding / 2),

                  //! Password input field
                  AuthTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    label: 'Enter your password',
                  ),
                  SizedBox(height: defaultPadding),

                  //! Forgot your password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: mediumText.copyWith(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding * 2),

                  //! Sign in button
                  CustomElevatedButton(
                    expanded: true,
                    constraints: BoxConstraints(minHeight: defaultBoxHeight),
                    child: Text(
                      "Sign in",
                      style: mediumTitle.copyWith(color: Theme.of(context).cardColor),
                    ),
                  ),
                  SizedBox(height: defaultPadding * 2),

                  //! Or with
                  Row(
                    children: [
                      Expanded(child: Divider(height: 2, color: Theme.of(context).shadowColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                        child: Text("Or with", style: smallTitle.copyWith(color: defaultGray)),
                      ),
                      Expanded(child: Divider(height: 2, color: Theme.of(context).shadowColor))
                    ],
                  ),
                  SizedBox(height: defaultPadding * 2),

                  //! Sign in with Google
                  CustomElevatedButton(
                    backgroundColor: Theme.of(context).canvasColor,
                    border: Border.all(width: 2, color: Theme.of(context).shadowColor),
                    constraints: BoxConstraints(minHeight: defaultBoxHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("G", style: mediumText.copyWith(color: defaultBlack, fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(width: defaultPadding / 4),
                        Text("Sign in with Google", style: mediumTitle)
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding * 2),

                  //! Don’t have account? Let’s
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have account? Let’s ", style: mediumText),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => SignUpPage());
                        },
                        child: Text("Sign up", style: smallTitle.copyWith(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // String? errorMessage;
  // Map<String, String> FormValues = {'email': "", "password": ""};

  // Future<void> signInWithEmailAndPassword(email, password) async {
  //   try {
  //     await Auth().signInWithEmailAndPassword(email: email, password: password);
  //     //await WriteData();
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //       ErrorToast(errorMessage);
  //     });
  //   }
  // }

  // InputOnChange(key1, value1) {
  //   FormValues.update(key1, (value) => value1);
  // }

  // WriteData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final db = FirebaseFirestore.instance;
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user?.uid;
  //   String usertype = '';
  //   print(uid);
  //   await db.collection('users').doc(uid).get().then((DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     print(data);
  //     usertype = data['usertype'];
  //   });
  //   await prefs.setString('usertype', usertype);
  // }

  // FormOnSubmit() async {
  //   if (FormValues['email'] == '') {
  //     ErrorToast('Email cannot be empty!!');
  //   } else if (FormValues['password'] == '') {
  //     ErrorToast('Password cannot be empty!!');
  //   } else {
  //     await signInWithEmailAndPassword(
  //         FormValues['email'], FormValues['password']);
  //     SuccessToast('Sign in Successful!');
  //     // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  //   }
  // }
  // @override
  // Widget build(BuildContext context) {
  //   var height = MediaQuery.of(context).size.height;
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: height * 0.13,
  //           ),
  //           Text(
  //             'Hello Again!',
  //             style: largeText,
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             'Sign in to your account',
  //             style: mediumSubTitle,
  //           ),
  //           const SizedBox(
  //             height: 15,
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(35),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 TextFormField(
  //                   style: mediumTitle,
  //                   decoration: const InputDecoration(
  //                     enabledBorder: OutlineInputBorder(
  //                         borderSide: BorderSide(width: 1, color: Colors.grey),
  //                         borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     focusedBorder: OutlineInputBorder(
  //                         borderSide:
  //                             BorderSide(width: 1, color: Colors.greenAccent),
  //                         borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     label: Text('Email Address',
  //                         style: TextStyle(color: Colors.greenAccent)),
  //                   ),
  //                   onChanged: (value) {
  //                     InputOnChange('email', value);
  //                   },
  //                 ),
  //                     style: mediumTitle,
  //                     decoration: const InputDecoration(
  //                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
  //                       focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
  //                       label: Text('Email Address', style: TextStyle(color: Colors.greenAccent)),
  //                     )),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 TextFormField(
  //                   style: mediumTitle,
  //                   decoration: const InputDecoration(
  //                     enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
  //                     label: Text('Enter your password', style: TextStyle(color: Colors.greenAccent)),
  //                   ),
  //                   onChanged: (value) {
  //                     InputOnChange('password', value);
  //                   },
  //                   obscureText: true,
  //                 ),
  //                 const SizedBox(
  //                   height: 25,
  //                 ),
  //                 InkWell(
  //                   onTap: () {},
  //                   child: Text(
  //                     'Forgot your password?',
  //                     style: mediumTitle.copyWith(color: Colors.greenAccent),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 30,
  //                 ),
  //                 CustomElevatedButton(
  //                   iconColor: Colors.deepOrange,
  //                   margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
  //                   height: 58,
  //                   expanded: true,
  //                   onDone: (isSuccess) {
  //                     print(isSuccess);
  //                   },
  //                   onTap: () async {
  //                     await Future.delayed(Duration(seconds: 2));
  //                     FormOnSubmit();
  //                     return true;

  //                   },
  //                   child: Text(
  //                     "Sign In",
  //                     style: mediumTitle.copyWith(color: defaultWhite),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 25,
  //                 ),
  //                 Row(
  //                   children: [
  //                     const Expanded(
  //                       child: Divider(
  //                         indent: 0,
  //                         endIndent: 10.0,
  //                         thickness: 1,
  //                       ),
  //                     ),
  //                     Text(
  //                       'Or With',
  //                       style: mediumSubTitle,
  //                     ),
  //                     const Expanded(
  //                       child: Divider(
  //                         indent: 0,
  //                         endIndent: 10.0,
  //                         thickness: 1,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 25,
  //                 ),
  //                 CustomElevatedButton(
  //                     border: Border.all(width: 1, color: defaultGray, strokeAlign: BorderSide.strokeAlignOutside),
  //                     borderRadius: const BorderRadius.all(Radius.circular(7)),
  //                     backgroundColor: Colors.white,
  //                     iconColor: Colors.deepOrange,
  //                     margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
  //                     height: 58,
  //                     expanded: true,
  //                     onDone: (isSuccess) {
  //                       print(isSuccess);
  //                     },
  //                     onTap: () async {
  //                       print('sign in w google btn pressed!');
  //                       await Future.delayed(const Duration(seconds: 2));
  //                       return false;
  //                     },
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           'G',
  //                           style: mediumText.copyWith(color: defaultBlack, fontSize: 22),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                         Text(
  //                           'Sign in with Google',
  //                           style: largeSubTitle,
  //                         )
  //                       ],
  //                     )),
  //                 const SizedBox(
  //                   height: 25,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "Don't have an account? Let's ",
  //                       style: mediumTitle,
  //                     ),
  //                     const SizedBox(
  //                       width: 5,
  //                     ),
  //                     InkWell(
  //                       onTap: () {},
  //                       child: Text(
  //                         "Sign Up",
  //                         style: mediumTitle.copyWith(color: Colors.greenAccent),
  //                       ),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
