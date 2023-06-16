import 'package:flutter/material.dart';
import 'package:social_app/component.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final Widget? onErrorWidget;
  final Color? onErrorWidgetColor;
  final EdgeInsetsGeometry padding;
  final Widget Function(BuildContext context, Widget child, ImageChunkEvent? loadingProgress)? loadingBuilder;
  const CustomNetworkImage({
    super.key,
    required this.url,
    this.onErrorWidget,
    this.onErrorWidgetColor = defaultGray,
    this.fit = BoxFit.cover,
    this.padding = const EdgeInsets.all(defaultPadding / 2),
    this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      fit: fit,
      url,
      loadingBuilder: (context, child, loadingProgress) {
        double? inData = loadingProgress?.cumulativeBytesLoaded.toDouble();
        double? totalData = loadingProgress?.expectedTotalBytes?.toDouble();
        double? value = totalData == null || inData == null ? null : inData / totalData;
        if (loadingProgress?.cumulativeBytesLoaded == loadingProgress?.expectedTotalBytes) {
          return child;
        }
        if (loadingBuilder == null) {
          return Center(
            child: FittedBox(
              child: SizedBox(
                height: defaultPadding,
                width: defaultPadding,
                child: CircularProgressIndicator(
                  value: value,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }
        return loadingBuilder!(context, child, loadingProgress);
      },
      errorBuilder: (context, error, stackTrace) => Padding(
        padding: padding,
        child: FittedBox(
          child: onErrorWidget ??
              Icon(
                Icons.no_photography,
                color: onErrorWidgetColor,
              ),
        ),
      ),
    );
  }
}
