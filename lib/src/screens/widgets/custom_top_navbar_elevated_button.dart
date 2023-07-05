import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_elevated_button_widget.dart';

class CustomTopNavbarElevatedButton extends StatelessWidget {
  const CustomTopNavbarElevatedButton({
    super.key,
    this.onTab,
    this.icon,
    this.hiddenBackground = false,
    this.backgroundColor,
  });
  final Function()? onTab;
  final IconData? icon;
  final bool hiddenBackground;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 45,
      width: 45,
      // margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      backgroundColor: backgroundColor ?? Colors.transparent,
      gradient: hiddenBackground
          ? null
          : LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                defaultGradientColor1.withOpacity(hiddenBackground ? 0.1 : 1),
                defaultGradientColor2.withOpacity(hiddenBackground ? 0.1 : 1)
              ],
            ),
      onDone: (_) {
        if (onTab != null) onTab!();
      },
      child: Icon(icon, color: Theme.of(context).cardColor),
    );
  }
}
