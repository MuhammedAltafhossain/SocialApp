// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/auth_screen_wrapper_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/main_screen_wrapper_controller.dart';
import 'package:social_app/src/controllers/services/functions/form_validation.dart';
import 'package:social_app/src/models/pojo_classes/user_model.dart';
import 'package:social_app/src/screens/widgets/auth_text_form_field.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';
import 'package:social_app/src/screens/widgets/custom_top_navbar_elevated_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthScreenWrapperController _authScreenWrapperController = Get.find();
  final MainScreenWrapperController _mainScreenWrapperController = Get.find();
  final DataController _dataController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController fnC = TextEditingController();
  final TextEditingController uC = TextEditingController();
  final TextEditingController eC = TextEditingController();
  final TextEditingController pC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(maxWidth: defaultMaxWidth),
              padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //! Title
                    Text("Hi there!", style: largeTitle),
                    SizedBox(height: defaultPadding / 4),

                    //! Subtitle
                    Text("Sign up to your account", style: mediumSubTitle),
                    SizedBox(height: defaultPadding),

                    //! Full Name field
                    AuthTextFormField(
                      textEditingController: fnC,
                      keyboardType: TextInputType.name,
                      label: 'Full Name',
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) return "Enter full Name";
                      },
                    ),
                    SizedBox(height: defaultPadding / 4),

                    //! Username input field
                    AuthTextFormField(
                      textEditingController: uC,
                      keyboardType: TextInputType.name,
                      label: 'Username',
                      validator: (p0) {
                        if (p0 == null) return "Invalid Username";
                        if (!usernameValidation(p0)) return "Invalid Username";
                      },
                    ),
                    SizedBox(height: defaultPadding / 4),

                    //! Email input field
                    AuthTextFormField(
                      textEditingController: eC,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email address',
                      validator: (p0) {
                        if (p0 == null) return "Invalid Email address";
                        if (!emailValidation(p0)) return "Invalid Email address";
                      },
                    ),
                    SizedBox(height: defaultPadding / 4),

                    //! Password input field
                    AuthTextFormField(
                      textEditingController: pC,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      label: 'Enter your password',
                      validator: (p0) {
                        if (p0 == null) return "Invalid password";
                        if (!passwordValidation(p0)) return "Invalid password";
                      },
                    ),
                    SizedBox(height: defaultPadding / 4),

                    //! Re-enter Password input field
                    AuthTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      label: 'Confirm your password',
                      validator: (p0) {
                        if (p0 == null) return "Re-enter password";
                        if (pC.text != p0) return "Password not matched";
                      },
                    ),
                    SizedBox(height: defaultPadding),

                    //! Sign up button
                    CustomElevatedButton(
                      expanded: true,
                      constraints: BoxConstraints(minHeight: defaultBoxHeight),
                      onTap: () async {
                        if (!(_formKey.currentState?.validate() ?? true)) return false;
                        return await _dataController.signup(
                          userModel: UserModel(
                            userId: "",
                            fullName: fnC.text,
                            email: eC.text,
                            userName: uC.text,
                            token: "",
                          ),
                          password: pC.text.trim(),
                        );
                      },
                      onDone: (isSuccess) {
                        if (isSuccess ?? false) _mainScreenWrapperController.moveToHome();
                      },
                      child: Text(
                        "Sign in",
                        style: mediumTitle.copyWith(color: Theme.of(context).cardColor),
                      ),
                    ),
                    SizedBox(height: defaultPadding),

                    //! Sign in with Google
                    Row(
                      children: [
                        Expanded(child: Divider(height: 2, color: Theme.of(context).shadowColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                          child: CustomTopNavbarElevatedButton(
                            hiddenBackground: true,
                            backgroundColor: Theme.of(context).canvasColor,
                            child: Center(child: Text("G", style: mediumText.copyWith(color: defaultBlack, fontSize: 22, fontWeight: FontWeight.bold))),
                          ),
                        ),
                        Expanded(child: Divider(height: 2, color: Theme.of(context).shadowColor))
                      ],
                    ),
                    SizedBox(height: defaultPadding / 2),

                    //! Don’t have account? Let’s
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have account? Let’s ", style: mediumText),
                        GestureDetector(
                          onTap: () => _authScreenWrapperController.pageController.animateToPage(0, duration: Duration(milliseconds: defaultDuration), curve: Curves.linear),
                          child: Text("Sign in", style: smallTitle.copyWith(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
