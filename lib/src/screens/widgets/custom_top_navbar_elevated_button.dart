import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

class CustomTopNavbarElevatedButton extends StatelessWidget {
  const CustomTopNavbarElevatedButton({
    super.key,
    this.onTab,
    this.icon,
  });
  final Function()? onTab;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 45,
      width: 45,
      // margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      backgroundColor: Colors.transparent,
      gradient: gradient,
      onDone: (_) {
        if (onTab != null) onTab!();
      },
      child: Icon(icon, color: Theme.of(context).canvasColor),
    );
  }
}
