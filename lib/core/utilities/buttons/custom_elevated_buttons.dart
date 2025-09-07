import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/firebase/index.dart';
import '/core/themes/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.label,
    required this.onPressed,
    required this.analyticsLabel,
    required this.analyticsParameters,
    super.key,
    this.backgroundColor,
    this.child,
    this.elevation = NumConstants.value4,
    this.borderRadius = NumConstants.value8,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double elevation;
  final double borderRadius;
  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.colorDA251D,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child:
          child ?? Text(label, style: TextStyle(color: AppColors.colorFFFFFF)),
    );
  }
}
