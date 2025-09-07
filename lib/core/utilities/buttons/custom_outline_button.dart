import 'package:flutter/material.dart';
import '/core/firebase/index.dart';
import '/core/themes/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.label,
    required this.onPressed,
    required this.analyticsLabel,
    required this.analyticsParameters,
    this.child,
    this.buttonStyle,
    super.key,
    this.borderColor,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;
  final Widget? child;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );
        onPressed();
      },
      style:
          buttonStyle ??
          OutlinedButton.styleFrom(
            side: BorderSide(
              color: borderColor ?? AppColors.primary,
              width: borderWidth,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
      child: child ?? Text(label, style: TextStyle(color: borderColor)),
    );
  }
}
