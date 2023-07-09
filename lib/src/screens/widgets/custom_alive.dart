import 'package:flutter/material.dart';

class CustomAlive extends StatefulWidget {
  final bool wantKeepAlive;
  final Widget child;

  const CustomAlive({super.key, required this.child, this.wantKeepAlive = true});

  @override
  State<CustomAlive> createState() => _CustomAliveState();
}

class _CustomAliveState extends State<CustomAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.wantKeepAlive;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
