import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_button.dart';
import 'package:social_app/src/screens/widgets/custom_rounded_profile_head.dart';
import 'package:social_app/src/screens/widgets/network_image.dart';

class ProfileHeadShortInfo extends StatelessWidget {
  final void Function()? onTap;
  final String? profileUrl;
  final String title;
  final String? subTitle;
  final Widget? endChild;
  final bool isActive;
  const ProfileHeadShortInfo({
    super.key,
    this.profileUrl,
    required this.title,
    this.subTitle,
    this.onTap,
    this.endChild,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (profileUrl != null) CustomRoundedProfileHead(profileUrl: profileUrl),
        if (profileUrl != null) const SizedBox(width: defaultPadding / 1.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: mediumTitle),
              if (subTitle != null) const SizedBox(height: defaultPadding / 8),
              if (subTitle != null) Text(subTitle!, style: mediumText.copyWith(height: 1)),
            ],
          ),
        ),
        if (endChild != null) endChild!,
      ],
    );
  }
}
