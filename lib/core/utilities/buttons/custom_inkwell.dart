import 'package:flutter/material.dart';
import '/core/firebase/index.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    required this.child,
    required this.onTap,
    required this.analyticsLabel,
    required this.analyticsParameters,
    super.key,
    this.splashColor = Colors.blueAccent,
    this.highlightColor = Colors.blue,
    this.padding = const EdgeInsets.all(8),
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color splashColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );

        onTap!();
      },
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: Padding(padding: padding, child: child),
    );
  }
}
