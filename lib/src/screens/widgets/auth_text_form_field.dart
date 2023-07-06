import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';
import 'package:social_app/src/screens/widgets/custom_text_field_widget.dart';

class AuthTextFormField extends StatelessWidget {
  AuthTextFormField({
    super.key,
    required this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textEditingController,
    this.obscureText = false,
  });
  final String label;
  final dynamic Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? textEditingController;
  final bool obscureText;

  final RxBool isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomBox(
        borderColor: isFocused.value ? Theme.of(context).primaryColor : Theme.of(context).shadowColor,
        borderWidth: 2,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        backgroundColor: Theme.of(context).canvasColor,
        child: CustomTextFormField(
          obscureText: obscureText,
          onFocusChange: (isFocused) => this.isFocused.value = isFocused,
          keyboardType: keyboardType,
          textEditingController: textEditingController,
          validator: validator,
          height: null,
          contentPadding: const EdgeInsets.all(0),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          labelText: label,
          notSelectedLabelStyle: mediumText.copyWith(color: defaultGray),
        ),
      ),
    );
  }
}
