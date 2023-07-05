import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/src/screens/screens/SignInScreen.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import '../../../component.dart';
import '../../../firebase/Auth.dart';
import '../../../utility/utility.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Map<String, String> FormValues = {
    'fname': "",
    'username': "",
    'email': '',
    'password1': '',
    'password2': ''
  };
  var errorMessage;

  Future<void> createUserWithEmailAndPassword(email, password) async {
    try {
      await Auth().createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        ErrorToast(errorMessage);
      });
    }
  }

  Future<void> addUserDetails() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'full name': FormValues['fname'],
      'username': FormValues['username'],
      'email': FormValues['email'],
    });
  }

  InputOnChange(key1, value1) {
    setState(() {
      FormValues.update(key1, (value) => value1);
    });
  }

  FormOnSubmit() async {
    if (FormValues['fname'] == '') {
      ErrorToast('Email cannot be empty!!');
    } else if (FormValues['username'] == '') {
      ErrorToast('Password cannot be empty!!');
    } else if (FormValues['password2'] == '') {
      ErrorToast('Password cannot be empty!!');
    } else if (FormValues['password1'] != FormValues['password2']) {
      ErrorToast('Password do not match!!');
    } else {
      await createUserWithEmailAndPassword(FormValues['email'], FormValues['password1']);
      await addUserDetails();
      SuccessToast("Registration Successful!");
      // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'Hi there!',
              style: largeText,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Create a new account',
              style: mediumSubTitle,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Full Name', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    onChanged: (value) {
                      InputOnChange('fname', value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Username', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    onChanged: (value) {
                      InputOnChange('username', value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Email Address', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    onChanged: (value) {
                      InputOnChange('email', value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Enter your password', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    onChanged: (value) {
                      InputOnChange('password1', value);
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: mediumTitle,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 55),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.greenAccent), borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Enter your password again', style: TextStyle(color: Colors.greenAccent)),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      InputOnChange('password2', value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    iconColor: Colors.deepOrange,
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    height: 50,
                    expanded: true,
                    onDone: (isSuccess) {
                      print(isSuccess);
                    },
                    onTap: () async {
                      await Future.delayed(Duration(seconds: 2));
                      FormOnSubmit();
                    },
                    child: Text(
                      "Sign Up",
                      style: mediumTitle.copyWith(color: defaultWhite),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        'Or',
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
                    height: 20,
                  ),
                  CustomElevatedButton(
                      border: Border.all(width: 1, color: defaultGray, strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      backgroundColor: Colors.white,
                      iconColor: Colors.deepOrange,
                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      height: 50,
                      expanded: true,
                      onDone: (isSuccess) {
                        print(isSuccess);
                      },
                      onTap: () async {
                        await Future.delayed(Duration(seconds: 2));
                        FormOnSubmit();
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
                            'Sign Up with Google',
                            style: largeSubTitle,
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? Let's ",
                        style: mediumTitle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const SignInPage());
                        },
                        child: Text(
                          "Sign in",
                          style:
                              mediumTitle.copyWith(color: Colors.greenAccent),
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
