import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTab});
  final Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 45,
      width: 45,
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      backgroundColor: Colors.transparent,
      gradient: gradient,
      onDone: (_) {
        if (onTab != null) onTab!();
      },
      child: Icon(Icons.arrow_back, color: Theme.of(context).canvasColor),
    );
  }
}
