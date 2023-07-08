import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';

class CustomRoundedProfileHead extends StatelessWidget {
  const CustomRoundedProfileHead({
    super.key,
    required this.profileUrl,
    this.onTap,
  });

  final String? profileUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedButton(
      onTap: onTap,
      notificationChild: Container(
        height: defaultPadding / 1.5,
        width: defaultPadding / 1.5,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Theme.of(context).cardColor,
              width: 2,
            )),
      ),
      backgroundColor: null,
      // onTap: onTap,
      child: CustomNetworkImage(
        url: profileUrl!,
      ),
    );
  }
}
