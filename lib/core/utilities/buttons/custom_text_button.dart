import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/firebase/index.dart';
import '/core/themes/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.analyticsLabel,
    required this.analyticsParameters,
    required this.onTap,
    this.child,
    super.key,
    this.label,
    this.textColor,
    this.style,
    this.buttonStyle,
  });

  final String analyticsLabel;
  final Map<String, Object> analyticsParameters;
  final VoidCallback onTap;
  final Widget? child;
  final String? label;

  final Color? textColor;
  final TextStyle? style;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
          buttonStyle ??
          ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) => Colors.transparent,
            ),
          ),
      onPressed: () {
        // FirebaseHelper.analytics.logEvent(
        //   name: analyticsLabel,
        //   parameters: analyticsParameters,
        // );

        onTap();
      },
      child:
          child ??
          Text(
            label ?? '',
            style:
                style ??
                TextStyle(
                  fontSize: NumConstants.value14,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? AppColors.color281A3E,
                ),
          ),
    );
  }
}
