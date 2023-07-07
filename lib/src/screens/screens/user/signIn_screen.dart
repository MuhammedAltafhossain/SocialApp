import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/controllers/data_controllers/data_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/auth_screen_wrapper_controller.dart';
import 'package:social_app/src/controllers/screens_controllers/main_screen_wrapper_controller.dart';
import 'package:social_app/src/controllers/services/functions/form_validation.dart';
import 'package:social_app/src/screens/widgets/auth_text_form_field.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthScreenWrapperController _authScreenWrapperController = Get.find();
  final MainScreenWrapperController _mainScreenWrapperController = Get.find();
  final DataController _dataController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController eC = TextEditingController();
  final TextEditingController pC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //! Title
                    Text("Hello Again!", style: largeTitle),
                    const SizedBox(height: defaultPadding / 4),

                    //! Subtitle
                    Text("Sign in to your account", style: mediumSubTitle),
                    const SizedBox(height: defaultPadding * 2),

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
                    const SizedBox(height: defaultPadding / 2),

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
                    const SizedBox(height: defaultPadding),

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
                    const SizedBox(height: defaultPadding * 2),

                    //! Sign in button
                    CustomElevatedButton(
                      expanded: true,
                      constraints: const BoxConstraints(minHeight: defaultBoxHeight),
                      onTap: () async {
                        if (!(_formKey.currentState?.validate() ?? true)) return false;
                        return await _dataController.signIn(email: eC.text.trim(), password: pC.text.trim());
                      },
                      onDone: (isSuccess) {
                        if (isSuccess ?? false) _mainScreenWrapperController.moveToHome();
                      },
                      child: Text(
                        "Sign in",
                        style: mediumTitle.copyWith(color: Theme.of(context).cardColor),
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),

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
                    const SizedBox(height: defaultPadding * 2),

                    //! Sign in with Google
                    CustomElevatedButton(
                      backgroundColor: Theme.of(context).canvasColor,
                      border: Border.all(width: 2, color: Theme.of(context).shadowColor, strokeAlign: BorderSide.strokeAlignOutside),
                      constraints: const BoxConstraints(minHeight: defaultBoxHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("G", style: mediumText.copyWith(color: defaultBlack, fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(width: defaultPadding / 4),
                          Text("Sign in with Google", style: mediumTitle)
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),

                    //! Don’t have account? Let’s
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have account? Let’s ", style: mediumText),
                        GestureDetector(
                          onTap: () => _authScreenWrapperController.pageController.animateToPage(1, duration: const Duration(milliseconds: defaultDuration), curve: Curves.linear),
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
      ),
    );
  }
}
