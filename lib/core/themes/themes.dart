import 'package:flutter/material.dart';
import '/core/themes/app_colors.dart';

abstract class AppThemes {
  static CheckboxThemeData get checkBoxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.color19A72A; // Checked state color
      }
      return Colors.white; // Unchecked state color
    }),
    checkColor: WidgetStateProperty.all<Color>(Colors.white),
  );

  static RadioThemeData get radioButtonTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.color19A72A; // Selected state color
      }
      return AppColors.lightColorScheme.outline; // Unselected state color
    }), // Ripple effect color
  );
}
