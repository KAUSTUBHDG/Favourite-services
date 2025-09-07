import 'package:flutter/material.dart';
import '/core/firebase/index.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.elevation,
    required this.borderRadius,
    required this.analyticsLabel,
    required this.analyticsParameters,
    this.backgroundColor,
    this.icon,
    this.padding,
    this.splashColor,
    this.highlightColor,
    super.key,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double elevation;
  final double borderRadius;
  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final Color? splashColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );
        onPressed();
      },
      splashColor: splashColor,
      highlightColor: highlightColor,
      padding: padding ?? EdgeInsets.zero,
      icon: icon ?? const Icon(Icons.edit_outlined),
    );
  }
}
