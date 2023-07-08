import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import '../../../component.dart';
import '../../../firebase/Auth.dart';
import '../../../utility/utility.dart';
import 'main_wrapper_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? errorMessage;
  Map<String, String> FormValues = {'email': "", "password": ""};

  Future<void> signInWithEmailAndPassword(email, password) async {
    try {
      await Auth().signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreenWrapper()),
          (route) => false);
      //await WriteData();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        ErrorToast(errorMessage);
      });
    }
  }

  InputOnChange(key1, value1) {
    FormValues.update(key1, (value) => value1);
  }

  WriteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final db = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    String usertype = '';
    print(uid);
    await db.collection('users').doc(uid).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
      usertype = data['usertype'];
    });
    await prefs.setString('usertype', usertype);
  }

  FormOnSubmit() async {
    if (FormValues['email'] == '') {
      ErrorToast('Email cannot be empty!!');
    } else if (FormValues['password'] == '') {
      ErrorToast('Password cannot be empty!!');
    } else {
      await signInWithEmailAndPassword(
          FormValues['email'], FormValues['password']);
      SuccessToast('Sign in Successful!');
      // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Email Address',
                          style: TextStyle(color: Colors.greenAccent)),
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
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      label: Text('Enter your password',
                          style: TextStyle(color: Colors.greenAccent)),
                    ),
                    onChanged: (value) {
                      InputOnChange('password', value);
                    },
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    height: 58,
                    expanded: true,
                    onDone: (isSuccess) {
                      print(isSuccess);
                    },
                    onTap: () async {
                      await Future.delayed(Duration(seconds: 2));
                      FormOnSubmit();
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
                      border: Border.all(
                          width: 1,
                          color: defaultGray,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      backgroundColor: Colors.white,
                      iconColor: Colors.deepOrange,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      height: 58,
                      expanded: true,
                      onDone: (isSuccess) {
                        print(isSuccess);
                      },
                      onTap: () async {
                        print('sign in w google btn pressed!');
                        await Future.delayed(const Duration(seconds: 2));
                        return false;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'G',
                            style: mediumText.copyWith(
                                color: defaultBlack, fontSize: 22),
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
