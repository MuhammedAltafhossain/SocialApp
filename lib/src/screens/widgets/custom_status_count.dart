import 'package:flutter/material.dart';
import 'package:social_app/component.dart';
import 'package:social_app/src/screens/widgets/custom_box.dart';

class CustomStatusCounter extends StatelessWidget {
  final String count;
  final String subTitle;
  final void Function()? onTap;
  const CustomStatusCounter({
    super.key,
    required this.count,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      padding: const EdgeInsets.all(defaultPadding / 2),
      onTap: onTap,
      borderRadius: BorderRadius.circular(defaultPadding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count, style: followerCount),
          Text(subTitle, style: mediumText),
        ],
      ),
    );
  }
}

class CustomCounter extends StatelessWidget {
  final String value;
  final void Function()? onTap;
  const CustomCounter({
    super.key,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: defaultPadding, minWidth: defaultPadding),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(100),
          boxShadow: defaultBoxShadowDown,
        ),
        child: Text(value, style: smallTitle.copyWith(color: Theme.of(context).canvasColor)),
      ),
    );
  }
}
