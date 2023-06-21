import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';

class ProfileHeadShortInfo extends StatelessWidget {
  final void Function()? onTap;
  final String profileUrl;
  final String title;
  final String subTitle;
  final Widget? endChild;
  const ProfileHeadShortInfo({
    super.key,
    required this.profileUrl,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.endChild,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRoundedButton(
          backgroundColor: null,
          // onTap: onTap,
          child: CustomNetworkImage(
            url: profileUrl,
          ),
        ),
        const SizedBox(width: defaultPadding / 1.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: mediumTitle),
              const SizedBox(height: defaultPadding / 8),
              Text(subTitle, style: mediumText.copyWith(height: 1)),
            ],
          ),
        ),
        if (endChild != null) endChild!,
      ],
    );
  }
}
