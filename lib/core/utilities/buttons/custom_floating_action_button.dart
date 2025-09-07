import 'package:flutter/material.dart';
import '/core/firebase/index.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    required this.onPressed,
    required this.analyticsLabel,
    required this.analyticsParameters,
    this.label,
    super.key,
    this.borderColor,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
    this.fabChild,
    this.backgroundColor,
    this.shape,
  });

  final String? label;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;
  final Widget? fabChild;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      shape: shape,
      onPressed: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );
        onPressed();
      },
      child:
          fabChild ?? Text(label ?? '', style: TextStyle(color: borderColor)),
    );
  }
}
