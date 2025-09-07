import 'package:flutter/material.dart';
import '/core/constants/num_constants.dart';
import '/core/enums/toast_type_enum.dart';
import '/core/themes/app_colors.dart';

class ToastUI extends StatelessWidget {
  const ToastUI({required this.type, required this.message, super.key});

  final AppToastType type;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: type.bgColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.color024000000,
            offset: const Offset(0, 5),
            blurRadius: NumConstants.value15,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: NumConstants.value4,
                vertical: NumConstants.value5,
              ),
              child: Container(
                width: NumConstants.value4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(NumConstants.value100),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: NumConstants.value7,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: NumConstants.value3),
                      child: Icon(
                        type.icon,
                        color: AppColors.primary,
                        size: NumConstants.value15,
                      ),
                    ),
                    const SizedBox(width: NumConstants.value4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          type.valueStr,
                          style: TextStyle(
                            color: AppColors.toast.toastText,
                            fontWeight: FontWeight.bold,
                            fontSize: NumConstants.value16,
                          ),
                        ),
                        const SizedBox(height: NumConstants.value4),
                        Text(
                          message,
                          style: TextStyle(
                            color: AppColors.toast.toastText,
                            fontWeight: FontWeight.normal,
                            fontSize: NumConstants.value14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
