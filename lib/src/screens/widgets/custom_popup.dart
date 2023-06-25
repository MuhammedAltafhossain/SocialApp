import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

class CustomPopUpWindow extends StatelessWidget {
  final Widget? title;
  final Widget? child;
  final Widget? footer;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;
  final int indentIndex;
  const CustomPopUpWindow({
    super.key,
    this.child,
    this.title,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.footer,
    this.padding = const EdgeInsets.all(0),
    this.indentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        child: Padding(
          padding: padding,
          child: Padding(
            padding: EdgeInsets.all(defaultPadding * indentIndex),
            child: Container(
              margin: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(defaultPadding)),
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              // height: null,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    if (title != null) Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding), child: title!),
                    if (title != null) const SizedBox(height: defaultPadding * 1.5),
                    Container(
                      constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 2) - (defaultPadding * 2)),
                      child: SingleChildScrollView(
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding), child: child),
                      ),
                    ),
                    if (footer != null) const SizedBox(height: defaultPadding),
                    if (footer != null)
                      Container(
                        constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 4) - (defaultPadding)),
                        child: SingleChildScrollView(
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: defaultPadding), child: footer),
                        ),
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
