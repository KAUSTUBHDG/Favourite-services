import 'package:flutter/material.dart';
import '/core/themes/app_colors.dart';

enum AppToastType { success, error, warning, info }

extension AppToastTypeExtension on AppToastType {
  /// Returns __boolean__ value if [AppToastType] is [AppToastType.success]
  bool get isSuccess => this == AppToastType.success;

  /// Returns __boolean__ value if [AppToastType] is [AppToastType.error]
  bool get isError => this == AppToastType.error;

  /// Returns __boolean__ value if [AppToastType] is [AppToastType.warning]
  bool get isWarning => this == AppToastType.warning;

  /// Returns __boolean__ value if [AppToastType] is [AppToastType.info]
  bool get isInfo => this == AppToastType.info;

  /// Returns __String__ value of [AppToastType]
  String get valueStr {
    switch (this) {
      case AppToastType.success:
        return 'Success';
      case AppToastType.error:
        return 'Error';
      case AppToastType.warning:
        return 'Warning';
      case AppToastType.info:
        return 'Info';
    }
  }

  /// Returns background __Color__ value of [AppToastType]
  Color get iconBgColor {
    switch (this) {
      case AppToastType.success:
        return AppColors.toast.successIconBG;
      case AppToastType.error:
        return AppColors.toast.errorIconBG;
      case AppToastType.warning:
        return AppColors.toast.warningIconBG;
      case AppToastType.info:
        return AppColors.toast.infoIconBG;
    }
  }

  Color get bgColor {
    switch (this) {
      case AppToastType.success:
        return AppColors.toast.successBG;
      case AppToastType.error:
        return AppColors.toast.errorBG;
      case AppToastType.warning:
        return AppColors.toast.warningBG;
      case AppToastType.info:
        return AppColors.toast.infoBG;
    }
  }

  /// Returns background __Color__ value of [AppToastType]
  Color get icColor {
    switch (this) {
      case AppToastType.success:
        return AppColors.toast.successBG;
      case AppToastType.error:
        return AppColors.toast.errorBG;
      case AppToastType.warning:
        return AppColors.toast.warningBG;
      case AppToastType.info:
        return AppColors.toast.infoBG;
    }
  }

  /// Returns icon of [AppToastType]
  IconData get icon {
    switch (this) {
      case AppToastType.success:
        return Icons.check_circle;
      case AppToastType.error:
        return Icons.error;
      case AppToastType.warning:
        return Icons.warning;
      case AppToastType.info:
        return Icons.info;
    }
  }
}
